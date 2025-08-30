%% ACO
% Nome: Leonardo Verçosa de Oliveira Valle
% Universidade Federal de Ouro Preto
% Matricula: 15.1.8166

% A função realiza a otimização pelo algoritmo colonia de formigas.

% Entradas da função
% n_pop - numero de individuos.
% n_var - numero de carros.
% FSM - matriz de soluções factiveis.
% Smax - curva de potencia do estacionamento.
% T - tempo total.
% tin - tempo de entrada de um veiculo.
% tout - tempo de saida de um veiculo.

% Saídas da função
% output.pop - retorna a população.
% output.Bestsol - retorna o a melhor soluçao.
% output.BestCosts - retorna o melhor valor.
% out.Stotal - Potencia do estacionamento + potencia dos veiculos.

%% inicio

function output =  ACO(FSM, param, param_prob)
fsm = FSM.aux;

n_var = param.N;
Smax = param.Smax;
T = param.T;
tin = param_prob.tin;
tout = param_prob.tout;

% ACO Parameters

MaxIt = param.MaxIt;               % Numero maximo de interaçoes
nAnt = param.n_pop;        % Numero de formigas
Q = 1;                     % Constante de atualização do feromonio

alpha = 1;                 % Phromone Exponential Weight
beta = 5;                  % Heuristic Exponential Weight

rho = 0.05;                % Taxa de evaporaçã

%% matriz tau deve ser uma só para todas as formigas, pois é nela que as formigas
%% trocam insformações
tau = zeros(n_var,T);       % Matriz de feromonios -- alterada
eta = zeros(n_var,T);       % -----alterada


BestCost = zeros(MaxIt,1);      % Vetor melhores valores

% Empty Ant
empty_ant.Tour=[];
empty_ant.Cost=[];

% Ant Colony Matrix
ant = repmat(empty_ant,nAnt,1);

% Best Ant
BestSol.Cost = inf;

% ACO Main Loop

%% formigueiro inicial
for k=1:nAnt
    for i = 1:n_var    % este é o número de VEs
        ant(k).Tour(i,:) = fsm{i,:}(randi([1 nAnt]),:);  %  -- alterado
    end
    [ant(k).Cost, Stotal(k,:)] = FO_caso_B(ant(k).Tour, param);
    if ant(k).Cost < BestSol.Cost
        BestSol = ant(k);
        bestStotal = Stotal(k,:);
    end
end

% Inicializar Phromones

%%%%%%%%%%%%%%%%%%%%%%%
for k=1:nAnt
    tour=ant(k).Tour;
    for i=1:n_var
        pos_ones=find(or(ant(k).Tour(i,:)==1,ant(k).Tour(i,:)==-1)); % encontrando posicao dos periodos de carga/descarga
        tau(i,pos_ones)=tau(i,pos_ones)+Q/(ant(k).Cost-BestSol.Cost+1);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%

%% a matriz eta deveria ser criada com uma heuristica que contenha informacao do problema
% por exemplo, pegar o valor medio da curva de demanda: periodos de demanda acima do valor medio devem favorecer descargas
% e periodos abaixo favorecer cargas

eta= ones(i,T);   % -- alterada
delta_pos=(max(Smax)-Smax)/max(Smax);
delta_neg=(Smax-min(Smax))/max(Smax);

for i= 1:n_var
    pos_ones=find(or(ant(1).Tour(i,:)==1,ant(1).Tour(i,:)==-1)); % encontrando posicao dos periodos de carga/descarga
    if length(pos_ones)~=0
        if ant(1).Tour(i,pos_ones(1))==1 % VE precisa carregar entao colocamos afastado do pico
            
            eta(i,tin:tout)= delta_pos(tin:tout)+1;   % -- alterada
            
            
        else     % VE precisa descarregar entao colocamos perto do pico
            
            eta(i,tin:tout)= delta_neg(tin:tout)+1;   % -- alterada
            
        end
    end
end


%% formigueiros subsequentes
count = 0;

for it=1:MaxIt
    % Move Ants
    for k=1:nAnt
        for i = 1:n_var    % este é o número de VEs
            
            pos_ones=find(or(ant(k).Tour(i,:)==1,ant(k).Tour(i,:)==-1));
            % encontrando posicao dos periodos de carga/descarga
            
            num_per=length(pos_ones);
            % numero de periodos de carga/descarga
            if num_per~=0
                % estes tempos sao aleatórios, entao deveria ser individuais para cada VE, ou seja (tin(i), tout(i)
                P=tau(i,:).^alpha.*eta(i,:).^beta;
                P(pos_ones)=0;     % nao visitar posicoes existentes
                P(1:tin-1)=0;      % nao visitar posicoes fora do intervalo factivel
                P(tout+1:T)=0;     % nao visitar posicoes fora do intervalo factivel
                P=P/sum(P);
                j=RouletteWheelSelectionACO(P,pos_ones);
                if ant(k).Tour(i,pos_ones(1))==1    % veiculo carregando
                    ant(k).Tour(i,j)=1;
                else    % veiculo descarregando
                    ant(k).Tour(i,j)=-1;
                end
                ant(k).Tour(i,pos_ones(randi([1 num_per])))=0;
            end
        end
        [ant(k).Cost, Stotal(k,:)] = FO_caso_B(ant(k).Tour, param);
        if ant(k).Cost <= BestSol.Cost
            BestSol = ant(k);
            bestStotal = Stotal(k,:);
        end
    end
    
    % Evaporation
    % esta etapa deve ser realizada antes, pois reduz todos os elementos de
    % tau, para depois atualizar apenas aqueles elementos de tau
    % promissores
    tau= (1-rho)*tau;
    
    % Update Phromones
    %%%%%%%%%%%%%%%%%%%%%%%
    for k=1:nAnt
        tour=ant(k).Tour;
        for i=1:n_var
            pos_ones=find(or(ant(k).Tour(i,:)==1,ant(k).Tour(i,:)==-1));
            % encontrando posicao dos periodos de carga/descarga
            tau(i,pos_ones)=tau(i,pos_ones)+Q/(ant(k).Cost-BestSol.Cost+1);
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%
    
    BestCost(it)=BestSol.Cost;
    BestDem(it,:)=bestStotal;
    
    % Show Iteration Information
    %     disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
end

% Results
output.pop = ant;
output.bestsol = BestSol;
output.bestcost = BestCost;
output.Stotal = bestStotal; %BestDem;
output.tau = tau;
output.eta = eta;

end

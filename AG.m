%% AG

% A função realiza a otimização pelo algoritmo genetico.

% Entradas da função
% n_pop - numero de individuos.
% n_var - numero de carros.
% FSM - matriz de soluções factiveis.
% Smax - curva de potencia do estacionamento.

% Saídas da função
% out.pop - retorna a população.
% out.Bestsol - retorna o a melhor soluçao.
% out.BestCosts - retorna o melhor valor.
% out.Stotal - Potencia do estacionamento + potencia dos veiculos.

%% inicio

function out =  AG(FSM, param)

fsm = FSM.aux;
n_pop = param.n_pop;
n_var = param.N;
Smax = param.Smax;

% parametros do AG
MaxIt = param.MaxIt;        % Numero maximo de interaçoes
beta = 1;
pC = 1;                     % Porcentagem de filhos
nC = round(pC*n_pop/2)*2;   % Numero de filhos
mu = 0.02;                  % Taxa de mutação

% Template for Empty Individuals
empty_individual.Position = [];
empty_individual.Cost = [];

% Best Solution Ever Found
bestsol.Cost = inf;

% Initialization
pop = repmat(empty_individual, n_pop, 1);

for i = 1:n_pop
    
    % Generate Random Solution
    
    for k = 1: n_var
        pop(i).Position(k,:) = fsm{k,:}(randi([1 n_var]),:);
    end
    
    % Evaluate Solution
    [pop(i).Cost,Stotal(i,:)] = FO_caso_B(pop(i).Position, param);
    
    % Compare Solution to Best Solution Ever Found
    if pop(i).Cost < bestsol.Cost
        bestsol = pop(i);
        bestStotal = Stotal(i,:);
    end
    
end

% Best Cost of Iterations
bestcost = nan(MaxIt, 1);

% Main Loop
for it = 1:MaxIt
    
    % Selection Probabilities
    c = [pop.Cost];
    avgc = mean(c);
    if avgc ~= 0
        c = c/avgc;
    end
    probs = exp(-beta*c);
    
    % Initialize Offsprings Population
    popc = repmat(empty_individual, nC/2, 2);
    
    % Crossover
    for k = 1:nC/2
        
        % Select Parents
        p1 = pop(RouletteWheelSelection(probs));
        p2 = pop(RouletteWheelSelection(probs));
        
        % Perform Crossover
        [popc(k, 1).Position, popc(k, 2).Position] = ...
            Crossover(p1.Position, p2.Position, param);
        
    end
    
    % Convert popc to Single-Column Matrix
    popc = popc(:);
    
    % Mutation
    for l = 1:nC
        
        % Perform Mutation
        popc(l).Position = Mutate(popc(l).Position, mu, fsm);
        
        % Evaluation
        [popc(l).Cost,Stotal(l,:)] = FO_caso_B(popc(l).Position, param);
        
        % Compare Solution to Best Solution Ever Found
        if popc(l).Cost < bestsol.Cost
            bestsol = popc(l);
            bestStotal = Stotal(l,:);
        end
        
        
    end
    
    % Merge and Sort Populations
    pop = SortPopulation([pop; popc], n_pop);
    
    % Update Best Cost of Iteration
    bestcost(it) = bestsol.Cost;
    
    % Display Itertion Information
    %     disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(bestcost(it))]);
    
end


% Results
out.pop = pop;
out.bestsol = bestsol;
out.bestcost = bestcost;
out.Stotal = bestStotal;

end


%% Parametros Probabilisticos

% Nome: Leonardo Verçosa de Oliveira Valle
% Matricula: 15.1.8166

% A função realiza analise probabilistica com parametros do problema.

% Entradas da função
% tin_medio - tempo de entrada medio no estacionamento
% tout_medio - tempo de saida medio do estacionamento
% D_medio - distancial total media percorrida
% N - numero de veiculos
% SC - numero de casos estocasticos por veiculo

% Saídas da função
% tin - tempo de entrada do veiculo no estacionamento
% tout -  tempo de saida do veiculo do estacionamento
% d - distancia da viagem da casa para o estacionamento
% STD - distancia da viagem subsequente do estacionamento para a casa,
% inclui uma parada durante o trajeto
% P - probabilidade de um caso estocastico acontecer

%% inicio

function  param_prob = Param_Prob(param)

tin_medio = param.tin;
tout_medio = param.tout;
D_medio =  param.D;
SC = param.N;

rng;

%% Variaveis Continuas

for i = 1:SC
    
    % calculo da distancia percorrida pelo veiculo
    
    D_total = randn(1,1).*10+D_medio;
    aux = [0:.1:D_total];
    media = sum(aux)/size(aux,2);
    
    para = 0;
    while para==0
        d = randn(1,1).*5+media;
        if d>0 & d<D_total
            para =1;
        end
    end
    
    aux2 = D_total - d;
    aux3 = [0:.1:aux2];
    media2 = sum(aux3)/size(aux3,2);
    
    while para==1
        d2 =  randn(1,1).*2.5+media2;
        if d2>0 & d2<D_total
            para =0;
        end
    end
    
    d3 = D_total - d - d2;
    STD = d2+d3;
    
    % calculo do tempo de entrada e saida do veiculo
    
    tin = ceil(randn(1).*1+tin_medio);
    tout = ceil(randn(1).*1+tout_medio);
    
    
    param_prob.d(i) =  d;
    param_prob.d2(i) =  d2;
    param_prob.d3(i) =  d3;
    param_prob.STD(i) =  STD;
    param_prob.tin(i) =  tin;
    param_prob.tout(i) =  tout;
    
end

end



% % PDF distancia
%
%     y = exp(-0.5 * ((aux - media)./5).^2) ./ (sqrt(2*pi) .* 5);
%     for j = 1:size(aux,2)
%         if round(d,1)== round(aux(j),1)
%             P_d = y(j);
%             break;
%         end
%     end
%
%     y2 = exp(-0.5 * ((aux3 - media2)./2.5).^2) ./ (sqrt(2*pi) .* 2.5);
%     for j = 1:size(aux3,2)
%         if (round(d2,1)==round(aux3(j),1))
%             P_d2 = y2(j);
%             break;
%         end
%     end
%
%     x = [0:.1:100];
%     y3 = exp(-0.5 * ((x - D_medio)./10).^2) ./ (sqrt(2*pi) .* 10);
%     for j = 1:size(x,2)
%         if (round(D_total,1)==round(x(j),1))
%             P_D = y3(j);
%             break;
%         end
%     end

%  % PDF tempo
%
%     x = [0:0.1:24];
%
%     y = exp(-0.5 * ((x - tin_medio)./1).^2) ./ (sqrt(2*pi) .* 1);
%     for j = 1:24
%         if isequal(tin, x(j))
%             P_tin = y(j);
%             break;
%         end
%     end
%
%     y2 = exp(-0.5 * ((x - tout_medio)./1).^2) ./ (sqrt(2*pi) .* 1);
%     for j = 1:24
%         if isequal(tout, x(j))
%             P_tout = y2(j);
%             break;
%         end
%     end

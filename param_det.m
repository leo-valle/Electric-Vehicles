%% Parametros Probabilisticos

% Nome: Leonardo Verçosa de Oliveira Valle
% Matricula: 15.1.8166

% A função dá valores para os parametros do problema de forma a controlar veiculos carregando e descarregando.

% Entradas da função

% N - numero de veiculos

% Saídas da função
% tin - tempo de entrada do veiculo no estacionamento
% tout -  tempo de saida do veiculo do estacionamento
% d - distancia da viagem da casa para o estacionamento
% STD - distancia da viagem subsequente do estacionamento para a casa,
% inclui uma parada durante o trajeto

%% inicio

function  [d_v,STD_v,tin_v,tout_v] = param_det(param)

SC = param.N;

for i = 1:SC
    
    if i < SC*0.51 
        
        % descarrega
        d = 20;
        STD = 10; 
        
    elseif i > SC*0.5
        
%         carrega
        d = 70;
        STD = 50;
     
    end
    
      tin = param.tin;
      tout = param.tout;
        
    d_v(i) =  d;
    STD_v(i) =  STD;
    tin_v(i) =  tin;
    tout_v(i) =  tout;
    
end

end


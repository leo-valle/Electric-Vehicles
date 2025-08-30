%% Cruzamento

% Nome: Leonardo Verçosa de Oliveira Valle
% Matricula: 15.1.8166

% A função realiza o cruzamento de dois cromossomos para o AG.

% Entradas da função
% x1 - cromossomo considerado pai 1.
% x2 - cromossomo considerado pai 2.
% n_var - numero de variaveis.
% T - tempo total

% Saídas da função
% y1 - cromossomo considerado como filho 1.
% y2 - cromossomo considerado como filho 2.

%% inicio

function [y1, y2] = Crossover(x1, x2, param)
n_var = param.N;
T = param.T;

alpha = randi([1 n_var], 1);
beta = randi([1, n_var], 1);

y1 = x1;
y2 = x2;

aux = zeros (n_var,T);

while alpha == beta
    alpha = randi([1 n_var], 1);
    beta = randi([1, n_var], 1);
end

if alpha < beta
    
    for i = alpha+1:beta-1
        aux(i,:) = y1(i,:);
        y1(i,:) = y2(i,:);
        y2(i,:) = aux(i,:);
    end
    
elseif  alpha > beta
    
    for i = beta+1:alpha-1
        aux(i,:) = y1(i,:);
        y1(i,:) = y2(i,:);
        y2(i,:) = aux(i,:);
    end
    
end

end
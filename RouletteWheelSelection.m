%% Seleção por roleta AG

% Nome: Leonardo Verçosa de Oliveira Valle
% Matricula: 15.1.8166

% A função realiza a seleçao por meio de roleta dos cromossomos que serrao considerados pais para o AG.

% Entradas da função
% p - A probabilidade para a roleta dos cromossomos.

% Saídas da função
% i - o numero do cromossomo selecionado como pai.

%% inicio

function i = RouletteWheelSelection(p)

r = rand*sum(p);
c = cumsum(p);
i = find(r <= c, 1, 'first');

end
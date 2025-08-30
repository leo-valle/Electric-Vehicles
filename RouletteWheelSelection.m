%% Sele��o por roleta AG

% Nome: Leonardo Ver�osa de Oliveira Valle
% Matricula: 15.1.8166

% A fun��o realiza a sele�ao por meio de roleta dos cromossomos que serrao considerados pais para o AG.

% Entradas da fun��o
% p - A probabilidade para a roleta dos cromossomos.

% Sa�das da fun��o
% i - o numero do cromossomo selecionado como pai.

%% inicio

function i = RouletteWheelSelection(p)

r = rand*sum(p);
c = cumsum(p);
i = find(r <= c, 1, 'first');

end
%% Seleção por roleta ACO

% Nome: Leonardo Verçosa de Oliveira Valle
% Matricula: 15.1.8166

% A função realiza a seleçao do caminho para as formigas.

% Entradas da função
% p - A probabilidade para a roleta dos caminhos a serem seguidos.

% Saídas da função
% j - o caminho a ser seguido pela formiga.

%% inicio

function j=RouletteWheelSelectionACO(P, pos_ones)

r=rand;
C=cumsum(P);
C(pos_ones)=0;
j=find(r<=C,1,'first');


end
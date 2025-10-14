%% Seleção por roleta ACO

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

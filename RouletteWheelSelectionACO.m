%% Sele��o por roleta ACO

% Nome: Leonardo Ver�osa de Oliveira Valle
% Matricula: 15.1.8166

% A fun��o realiza a sele�ao do caminho para as formigas.

% Entradas da fun��o
% p - A probabilidade para a roleta dos caminhos a serem seguidos.

% Sa�das da fun��o
% j - o caminho a ser seguido pela formiga.

%% inicio

function j=RouletteWheelSelectionACO(P, pos_ones)

r=rand;
C=cumsum(P);
C(pos_ones)=0;
j=find(r<=C,1,'first');


end
%% Seleção por roleta ACO

% Nome: Leonardo Verçosa de Oliveira Valle
% Matricula: 15.1.8166

% A função realiza a seleçao do caminho para as formigas.

% Entradas da função
% p - A probabilidade para a roleta dos caminhos a serem seguidos.

% Saídas da função
% j - o caminho a ser seguido pela formiga.

%% inicio

function [j]=RouletteWheelSelectionACO4(P,pos_ones,explo,tin,tout)
num=length(pos_ones);
C=cumsum(P);
nn=1;
while nn<=num
r=rand;
%C(pos_ones)=0;
rexp=rand;
if rexp<explo
j(nn)=randi([tin,tout]);
else
    j(nn)=find(r<=C,1,'first');
end
if nn>1 && sum(j(nn)==j(1:nn-1))>0
    nn=nn-1;
end
nn=nn+1;
% if nn>1 && j(nn)==j(nn-1) && j(nn)~=tout
%     j(nn)=j(nn-1)+1;
% end
% if nn>1 && j(nn)==j(nn-1) && j(nn)~=tin
%     j(nn)=j(nn-1)-1;
% end

end
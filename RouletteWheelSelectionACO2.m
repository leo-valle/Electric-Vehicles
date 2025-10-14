%% Seleção por roleta ACO

% A função realiza a seleçao do caminho para as formigas.

% Entradas da função
% p - A probabilidade para a roleta dos caminhos a serem seguidos.

% Saídas da função
% j - o caminho a ser seguido pela formiga.

%% inicio

function [j]=RouletteWheelSelectionACO2(P,pos_ones)
num=length(pos_ones);
C=cumsum(P);
nn=1;
while nn<=num
r=rand;
%C(pos_ones)=0;
    j(nn)=find(r<=C,1,'first');
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

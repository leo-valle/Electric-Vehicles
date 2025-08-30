%% Muta��o

% Nome: Leonardo Ver�osa de Oliveira Valle
% Matricula: 15.1.8166

% A fun��o realiza a opera�ao de muta��o do AG.

% Entradas da fun��o
% x - cromossomo que sofrera a muta�ao.
% mu - taxa de muta��o utilizada
% FSM - matriz de solu�oes possiveis

% Sa�das da fun��o
% y - cromossomo apos o processo de muta�ao

%% inicio
function y = Mutate(x, mu, FSM)

y = x;

N = size(x,1);
n = size(FSM,1);

for i = 1:N
flag = (rand(1) < mu);

if flag == true
    
    pos = i;
    y(pos,:) = FSM{i,:}(i,:);
    
end

end
end
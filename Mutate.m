%% Mutação

% Nome: Leonardo Verçosa de Oliveira Valle
% Matricula: 15.1.8166

% A função realiza a operaçao de mutação do AG.

% Entradas da função
% x - cromossomo que sofrera a mutaçao.
% mu - taxa de mutação utilizada
% FSM - matriz de soluçoes possiveis

% Saídas da função
% y - cromossomo apos o processo de mutaçao

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
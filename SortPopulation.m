%% Sele��o

% Nome: Leonardo Ver�osa de Oliveira Valle
% Matricula: 15.1.8166

% A fun��o realiza a sele�ao dos melhores cromossomos para o AG.

% Entradas da fun��o
% pop - A popula�ao de cromossomos com pais e filhos.

% Sa�das da fun��o
% pop - popula�ao com os melhores valores de custo

%% inicio
function pop = SortPopulation(pop, n_pop)

[~, so] = sort([pop.Cost]);
pop = pop(so);
pop = pop(1:n_pop);

end
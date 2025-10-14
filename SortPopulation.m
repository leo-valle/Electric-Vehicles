%% Seleção

% A função realiza a seleçao dos melhores cromossomos para o AG.

% Entradas da função
% pop - A populaçao de cromossomos com pais e filhos.

% Saídas da função
% pop - populaçao com os melhores valores de custo

%% inicio
function pop = SortPopulation(pop, n_pop)

[~, so] = sort([pop.Cost]);
pop = pop(so);
pop = pop(1:n_pop);


end

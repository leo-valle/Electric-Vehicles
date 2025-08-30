%% FO_caso_B

% Nome: Leonardo Verçosa de Oliveira Valle
% Matricula: 15.1.8166

% A função realiza o calculo do custo da função objetivo para a estrategia B 
% do problema de VEs, a qual tende a minimizar o pico da curva de carga.

% Entradas da função
% Cromossomo - matrizes com soluçoes para o problema
% Smax (potência aparente) - Potencia aparente do local.

% Saídas da função
% output.PAR - É o minimo calculado para a função objetivo.
% output.Stotal - Potencia aparente do local + potencia aparente dos veiculos.

%% inicio
function [PAR, Stotal] = FO_caso_B(cromossomo, param)
Smax = param.Smax;
rPEV = param.rPEV;
T = param.T;

Stotal = (sum(cromossomo)*rPEV)+Smax;

PAR = max(Stotal)/(sum(Stotal)/T);

end
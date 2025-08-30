%% FO_caso_B

% Nome: Leonardo Ver�osa de Oliveira Valle
% Matricula: 15.1.8166

% A fun��o realiza o calculo do custo da fun��o objetivo para a estrategia B 
% do problema de VEs, a qual tende a minimizar o pico da curva de carga.

% Entradas da fun��o
% Cromossomo - matrizes com solu�oes para o problema
% Smax (pot�ncia aparente) - Potencia aparente do local.

% Sa�das da fun��o
% output.PAR - � o minimo calculado para a fun��o objetivo.
% output.Stotal - Potencia aparente do local + potencia aparente dos veiculos.

%% inicio
function [PAR, Stotal] = FO_caso_B(cromossomo, param)
Smax = param.Smax;
rPEV = param.rPEV;
T = param.T;

Stotal = (sum(cromossomo)*rPEV)+Smax;

PAR = max(Stotal)/(sum(Stotal)/T);

end
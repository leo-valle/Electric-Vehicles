%% Energia_req

% Nome: Leonardo Verçosa de Oliveira Valle
% Matricula: 15.1.8166

% A função realiza o calculo da energia requerida pelo veiculo.

% Entradas da função
% N - quantidade de veiculos no estacionamento
% d - primeira distancia percorrida, da casa ate o estacionamento.
% Bc - capacidade da bateria
% dR - autonomia da bateria.
% STD - distancia da viagem do veiculo do estacionamento ate em casa

% Saídas da função
% output.Ereq - É a energia requerida pelo veiculo.
% output.estrategia_car - variavel para definir qual a necessidade do
% veiculo, carregar, descarregar ou inerte.
% output.SOCa - SOCa.

%% inicio

function output = Energia_req(param, param_prob)
Bc = param.Bc;
N = param.N;
dR = param.dR;
nc = 1;
nd = 1;
d = param_prob.d;             
STD = param_prob.STD;           

for i = 1:N

SOCa(i) = 1-(d(i)/dR);
SOCd(i) = (STD(i)/dR) +0.2;

if SOCd(i) >= 1
    SOCreq(i) = 1-SOCa(i);
    estrategia_car(i) = 1;
    Ereq(i) = (SOCreq(i)*Bc)/nc;
end

if SOCa(i) < SOCd(i) && SOCd(i) < 1
    SOCreq(i) = SOCd(i)-SOCa(i);
    estrategia_car(i) = 1;
    Ereq(i) = (SOCreq(i)*Bc)/nc;
end

if SOCd(i) == SOCa(i)
    estrategia_car(i) = 0;
    Ereq(i) = 0;
end

if 0.2 < SOCd(i) && SOCd(i) < SOCa(i)
    SOCreq(i) = -(SOCa(i)-SOCd(i));
    estrategia_car(i) = -1;
    Ereq(i) = (SOCreq(i)*Bc)/(1/nd);
end

end

output.estrategia_car = estrategia_car;
output.Ereq = Ereq;
output.SOCa = SOCa;

end

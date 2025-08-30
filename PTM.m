%% Power Transaction Model

% Nome: Leonardo Verçosa de Oliveira Valle
% Matricula: 15.1.8166

% A função faz os calculos das equações de Power transaction do paper 2.

% Entradas da função
% N - numero de veiculos
% T - tempo de um dia 24 horas
% Cn - capacidade da bateria
% r - consumo da bateria
% np - eficiencia de conversao
% Pp - taxa de carregamento
% P - probabilidade dos casos estocasticos
% Cs - carga da bateria no inicio da viagem
% lb - distancia percorrida pelo veiculo antes de entrar no estacionamento
% la - distancia percorrida pelo veiculo ao sair do estacionamento para seu
% destino final
% tpi - tempo de entrada do veiculo no estacionameto

% Saídas da função
% ADPTV -  average daily power transaction variation, curva media de
% potencia de um dia para os veiculos

%% inicio

function  ADPTV = PTM(param, param_prob)
N = param.N;
T = param.T;
Cn = param.Bc;
r = 0.23e3;
np = 1;
Pp = param.rPEV;
PTF = zeros(N,T);
ADPTV = zeros(1,T);
P = param_prob.P;

for i= 1:N
    
    Cs = param.Bc;
    lb = param_prob.d(i);
    la = param_prob.STD(i);
    tpi = param_prob.tin(i);
    
    Cp = Cs - lb*r;
    Cr = la *r+0.2*Cn;
    Ep = (Cp - Cr)*np;
    %  Ep2 = (Cp - Cr)*(np^-1);
    
    tr = abs(Ep)*(Pp^-1);
    tpo = tpi+ tr;
    
    for j = tpi:ceil(tpo)
        if Ep<0
            PTF(i,j) = -(Ep/ceil(tr))/1000;
        else
            PTF(i,j) = -(Ep/ceil(tr))/1000;
        end
    end
    
    ADPTV = ADPTV + (P(i)*PTF(i,:));
end

x = 1:T;
plot(x,ADPTV)
xlabel('Tempo (hr)');
ylabel('ADPTV (kW/veiculo)');
grid on;

figure
for i =1:N
    hold on
    plot(x,PTF(i,:))
end

end

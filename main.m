%% Trabalho conclusao de curso

% Nome: Leonardo Verçosa de Oliveira Valle
% Matricula: 15.1.8166

%% inicio

clc;
clear all;
close all;

%% Parametros do Problema

parametros.T = 24;                       % 24 horas
parametros.rPEV = 2e3;                   % taxa de carregamento
parametros.dR = 100;                     % autonomia da bateria
parametros.Bc = 24e3;                    % capacidade da bateria

parametros.N = 100;                      % numero de VEs
parametros.n_pop = 100;                  % populaçao
parametros.MaxIt = 300;                  % numero de iteraçoes

% Parametros probabilisticos

parametros.tin = 8;                      % 8 horas tempo de entrada
parametros.tout = 17;                    % 17 horas tempo de saida
parametros.D = 55;                       % distancia total percorrida

% curva de potencia

% curva de teste 1 (curva utilizada inicialmente)
parametros.Smax = [0.7 0.75 0.78 0.80 0.79 0.84 0.87 0.89 0.90 0.91 0.86 0.91 0.93 0.92 0.94 0.90 0.88 0.84 0.82 0.83 0.84 0.83 0.81 0.78]*1000e3;
% parametros.Smax = [0.7 0.75 0.78 0.80 0.79 0.84 0.87 0.89 0.90 0.91]*1000e3;

% curva de teste 2 (curva com vale negativo)
% parametros.Smax = [0.72 0.76 0.75 0.70 0.77 0.7 0.75 0.75 0.74 0.12 0.16 0.14 0.15 0.79 0.77 0.76 0.70 0.77 0.73 0.79 0.75 0.71 0.77 0.70]*1000e3;

% curva de teste 3 (curva com vale positivo)
% parametros.Smax = [0.72 0.76 0.75 0.70 0.77 0.7 0.75 0.75 0.74 1.5 1.6 1.5 1.6 0.79 0.77 0.76 0.70 0.77 0.73 0.79 0.75 0.71 0.77 0.70]*1000e3;

% curva de teste 4 (curva achatada)
% parametros.Smax = [0.72 0.76 0.75 0.70 0.77 0.7 0.75 0.75 0.74 0.76 0.76 0.74 0.73 0.79 0.77 0.76 0.70 0.77 0.73 0.79 0.75 0.71 0.77 0.70]*1000e3;

it = 300;      % numero de iterações

for i = 1:it
    
    disp([' ']);
    disp(['Repetição ' num2str(i)]);
    
    %% Analise  Probabilistica
    
    param_prob(i) = Param_Prob(parametros);
    
    % teste para modelo deterministico
    %         [param_prob(i).d, param_prob(i).STD, param_prob(i).tin, param_prob(i).tout] = param_det(parametros);
    
    %% Power Transaction Model
    
    % ADPTV = PTM(parametros, param_prob);
    
    %% Energia Requerida
    
    % calcula a energia requerida
    E_req = Energia_req (parametros, param_prob(i));
    
    %% FSM
    
    % cria a amatriz FSM
    [M_FSM, param_prob(i).tout] = FSM (E_req, parametros, param_prob(i));
    
    %% AG
    
    output(i)  = AG(M_FSM, parametros);
    
    %% ACO
    
    output2(i) = ACO(M_FSM, parametros, param_prob(i));
    
    %%
    PARAG(i) = output(i).bestsol.Cost;
    mediapar(i) = mean(PARAG);
    desvioAG(i) = std(PARAG);
    
    PARACO(i) = output2(i).bestsol.Cost;
    mediapar2(i) = mean(PARACO);
    desvioACO(i) = std(PARACO);
    
    KVAmax(i) = max(output(i).Stotal);
    mediaKVA(i) = mean(KVAmax);
    desvioKVA(i) = std(KVAmax);
    
    KVAmax2(i) = max(output2(i).Stotal);
    mediaKVA2(i) = mean(KVAmax2);
    desvioKVA2(i) = std(KVAmax2);
    
end


%% Plotar Resultados

% h  = Plot_hist(output, it);
%
% x = 1:it;
%
% figure;
% plot(x,PARACO,'b', x,PARAG,'r');
% legend('PAR ACO','PAR AG')
% xlabel('Iteration');
% ylabel('PAR');
% % title('PAR');
% grid on;
%
% % figure;
% % plot(x,parametros.Smax,'b',x,output.Stotal,'r');
% % legend('S inicial','S ultima geração')
% % xlabel('Tempo');
% % ylabel('Potencia');
% % title('Curva de potencia');
% % grid on;
%
% desvioACO = std(PARACO)
% desvioAG = std(PARAG)
% m_ACO = mean(PARACO)
% m_AG = mean(PARAG)
%
%
% for i = 1:it
% media(i) = mean(param_prob(i).d);
% media2(i) = mean(param_prob(i).d2);
% media3(i) = mean(param_prob(i).d3);
% media4(i) = mean(param_prob(i).tin);
% media5(i) = mean(param_prob(i).tout);
%
% desvio(i) = std(param_prob(i).d);
% desvio2(i) = std(param_prob(i).d2);
% desvio3(i) = std(param_prob(i).d3);
% desvio4(i) = std(param_prob(i).tin);
% desvio5(i) = std(param_prob(i).tout);
% end
%
% figure;
% histogram(media);
% legend('d')
% xlabel('distancia (km)');
% ylabel('');
% grid on;
%
% figure;
% histogram(media2);
% legend('d2')
% xlabel('distancia (km)');
% ylabel('');
% grid on;
%
% figure;
% histogram(media3);
% legend('d3')
% xlabel('distancia (km)');
% ylabel('');
% grid on;
%
% y = 6:10;
%
% figure;
% histogram(round(media4), y);
% legend('tin')
% xlabel('tempo de entrada (hrs)');
% ylabel('');
% grid on;
%
% y = 15:20;
%
% figure;
% histogram(round(media5),y);
% legend('tout')
% xlabel('tempo de entrada (hrs)');
% ylabel('');
% grid on;
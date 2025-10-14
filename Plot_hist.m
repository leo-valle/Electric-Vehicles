%% Plotar histogramas

% A função realiza o plot dos resultados em histograma.

% Entradas da função
% result- valores medios encontrados da otimização

% Saídas da função
% h - Histograma com os resultados obtidos

%% inicio

function h = Plot_hist(result, it)

for i= 1:it
x(i) = result(i).bestsol.Cost;
end

figure;
h = histogram(x,it);
hold on
% y = 1:.1:1.5;
% mu = mean(x);
% sigma = std(x);
% f = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
% plot(y,f,'LineWidth',1.5)
title(['PAR de ' num2str(it) ' interaçoes']);
xlabel(['PAR de ' num2str(it) ' interaçoes']);
ylabel('Frequencia');
grid on;

end


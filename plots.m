

x = 1:300;
plot(x)
xlim([1 300])
xlabel('iterações');
ylabel('Desvio padrão do PAR');



x = 1:24;
Smax = [0.7 0.75 0.78 0.80 0.79 0.84 0.87 0.89 0.90 0.91 0.86 0.91 0.93 0.92 0.94 0.90 0.88 0.84 0.82 0.83 0.84 0.83 0.81 0.78]*1000;
for i = 1:24
    y (i) = 8.4667e+02;
end
plot(x,Smax,x,y)
xlim([1 24])
xlabel('Tempo (h)');
ylabel('Potencia (kVA)');


% PDF tempo

x = [1:24];
y = exp(-0.5 * ((x - 8)./1).^2) ./ (sqrt(2*pi) .* 1);

y2 = exp(-0.5 * ((x - 18)./1).^2) ./ (sqrt(2*pi) .* 1);


stem(x, y, "filled")
xlim([1 24])
ylabel('Valor da PDF');
xlabel('Tempo (h)');

figure
stem(x, y2, "filled")
xlim([1 24])
ylabel('Valor da PDF');
xlabel('Tempo (h)');


x = 1:24;
Smax = [0.7 0.75 0.78 0.80 0.79 0.84 0.87 0.89 0.90 0.91 0.86 0.91 0.93 0.92 0.94 0.90 0.88 0.84 0.82 0.83 0.84 0.83 0.81 0.78]*1000e3;
for i = 1:24
    y (i) = 8.4667e+05;
end
stem(Smax)
xlim([1 24])
xlabel('Tempo');
ylabel('Potencia');
title('Curva de potencia');




x = 1:24;
Smax = [0.7 0.75 0.78 0.80 0.79 0.84 0.87 0.89 0.90 0.91 0.86 0.91 0.93 0.92 0.94 0.90 0.88 0.84 0.82 0.83 0.84 0.83 0.81 0.78]*1000;
plot(x,Smax,8,0.89*1000,"ko", 18,0.84*1000,"ko", x, output2.Stotal/1000)
legend ('Antes da otimização', '8 hrs', '18 hrs', 'Depois da otimização')
xlim([1 24])
yticks(0:50:1000)
xlabel('Tempo (h)');
ylabel('Potencia (kVA)');



x = 1:24;
Smax = [0.7 0.75 0.78 0.80 0.79 0.84 0.87 0.89 0.90 0.91 0.86 0.91 0.93 0.92 0.94 0.90 0.88 0.84 0.82 0.83 0.84 0.83 0.81 0.78]*1000;
plot(x,Smax,8,0.89*1000,"ko", 18,0.84*1000,"ko", x, output.Stotal/1000)
legend ('Antes da otimização', '8 hrs', '18 hrs', 'Depois da otimização')
xlim([1 24])
yticks(0:50:1000)
xlabel('Tempo (h)');
ylabel('Potencia (kVA)');




x = 1:300;
plot(x,mediapar,"k", x, mediapar2,'r')
legend ('AG', 'ACO')
xlim([1 300])
yticks('auto')
xlabel('iterações');
ylabel('PAR');

figure

plot(x,desvioAG,"k", x, desvioACO,'r')
legend ('AG', 'ACO')
xlim([1 300])
yticks('auto')
xlabel('iterações');
ylabel('PAR');

figure 
plot(x,mediaKVA,"k", x, mediaKVA2,'r')
legend ('AG', 'ACO')
xlim([1 300])
yticks('auto')
xlabel('iterações');
ylabel('Potencia (kVA)');

figure

plot(x,desvioKVA,"k", x, desvioKVA2,'r')
legend ('AG', 'ACO')
xlim([1 300])
xlabel('iterações');
ylabel('Potencia (kVA)');

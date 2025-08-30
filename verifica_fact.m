%% verifica_fact

% Nome: Leonardo Verçosa de Oliveira Valle
% Matricula: 15.1.8166

% A função verifica se a solução da formiga é factivel e corrige a
% estrategia infactivel.

% Entradas da função
% Formiga - vetor com uma estrategia de um veiculo para o problema
% param - parametros do problema
% Ereq - energia requerida do veiculo
% estrategia_car - variavel para definir qual a necessidade do
% veiculo, carregar, descarregar ou inerte.

% Saídas da função
% formiga - retorna uma estrategia factivel para o veiculo.

%% inicio
function Ant = verifica_fact(Formiga, param, Ereq , estrategia_car)
rPEV = param.rPEV;
tin = param.tin;
tout = param.tout;
Ant = Formiga;

aux = sum(Formiga*rPEV);

if estrategia_car == 1
    
    Ereq = ceil(Ereq/rPEV)*rPEV;
    
    while aux~=Ereq
        
        if aux > Ereq
            pos = randi([tin tout]);
            Ant(:,pos) = 0;
        end
        
        if aux < Ereq
            pos = randi([tin tout]);
            Ant(:,pos) = 1;
        end
        
        for i= tin:tout
            if Ant(:,i)== -1
                Ant(:,i) = 0;
            end
        end
        
        aux = sum(Ant*rPEV);
    end
    
else
    
    Ereq = floor(Ereq/rPEV)*rPEV;
    
    while aux~=Ereq
        
        if aux > Ereq
            pos = randi([tin tout]);
            Ant(:,pos) = -1;
        end
        
        if aux < Ereq
            pos = randi([tin tout]);
            Ant(:,pos) = 0;
        end
        
        for i= tin:tout
            if Ant(:,i)== 1
                Ant(:,i) = 0;
            end
        end
        
        aux = sum(Ant*rPEV);
    end
end

end
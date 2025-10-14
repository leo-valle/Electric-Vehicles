%% FSM

% A constroi a matriz FSM.

% Entradas da função
% Ereq - É a energia requerida pelo veiculo.
% estrategia_car - variavel para definir qual a necessidade do veiculo.
% tin - tempo de entrada.
% tout - tempo de saida.
% SOCa - state of charge A
% Bc - capacidade da bateria
% T - tempo total
% n_pop - tamanho da população
% N - numero de veiculos no estacionamento

% Saídas da função
% m_fsm.FSM - matriz de soluções factiveis.
% m_fsm.aux - matriz de soluções factiveis em formato de celulas.

%% inicio

function [m_fsm, tout] = FSM (E_req, param, param_prob)

N = param.N;
rPEV = param.rPEV;
T = param.T;
Bc = param.Bc;
aux2 = cell(N,1);

for i = 1:N
    SOCa = E_req.SOCa(i);
    Ereq = E_req.Ereq(i);
    estrategia_car = E_req.estrategia_car(i);
    tin = param_prob.tin(i);
    tout(i) = param_prob.tout(i);
    
    delta_t = tout(i) - tin;
    
    for j = 1:N 
        soma = 0;
        para = 0;
        carga = 0;
        sk = zeros(1,T);
        carga2=0;
        
        carga = SOCa*Bc;
        carga = ceil(carga/rPEV)*rPEV;
        
        if estrategia_car == 1
            Ereq = ceil(Ereq/rPEV)*rPEV;
            ver = Ereq/rPEV;
            
            while ver > delta_t
                tout(i) = tout(i)+1;
                delta_t = tout(i) - tin;
            end
                
            while para == 0 || para2 == 0
                if soma < Ereq
                    pos = randi([tin tout(i)]);
                    sk(pos)= 1;
                    soma = sum(rPEV*sk);
                end
                
                if soma == Ereq
                    para = 1;
                end
                
                for k = tin:tout(i)
                    carga2 = carga+rPEV*sk(k);
                    
                    if carga2 < 0.20*Bc
                        para2 = 0;
                    else
                        para2 = 1;
                    end
                    
                end
            end
        end
        
        if estrategia_car == -1
            Ereq = floor(Ereq/rPEV)*rPEV;
             ver = -Ereq/rPEV;
             
             while ver > delta_t
                tout(i) = tout(i)+1;
                delta_t = tout(i) - tin;
             end
            
            while para == 0 || para2 == 0
                if soma > Ereq
                    pos = randi([tin tout(i)]);
                    sk(pos)= -1;
                    soma = sum(rPEV*sk);
                end
                
                if soma == Ereq
                    para = 1;
                end
                
                for k = tin:tout(i)
                    carga2 = carga+rPEV*sk(k);
                    if carga2 < 0.20*Bc
                        para2 = 0;
                    else
                        para2 = 1;
                    end
                end
                
            end
        end
        aux(j,:) = sk;
    end
    
    aux2(i,:)= {aux};
end

m_fsm.aux = aux2;
m_fsm.FSM = cell2mat(aux2);


end

function [W,dW,dWAnt] = backward(X,U,W,topg,fun,B,dW,dWAnt,er,n,m)

%%% Executa a faze backward do algoritmo Backpropagation

[l,c] = size(X{1}); % Dimensões dos dados de entrada

for i=1:length(topg)-1
    ind = length(topg) - i; %% indice regressivo
    [ui,dui] = fun{ind}(B{ind},U{ind});     %% (dui) derivada da função de ativação em relação ao potencial de ativaçao
    if ind == length(topg)-1
        gli = er.*dui; %% gradiente local para os pesos que fazem ligação com os neuronios de saida
    else
        gli = (glAnt*wAnt(2:end,:)').*dui; %% gradiente local para os demais pesos
    end
    dW{ind} = n*[-ones(l,1) X{ind}]'*gli; % adiciona a coluna de termos (-1) para o bias
    W{ind} = W{ind} + dW{ind} + m*dWAnt{ind}; %n*[-ones(l,1) X{ind}]'*gli;  %% regra delta generalizada com momentum
    
    % Atualização de matrizes para calculos a posteriori
    glAnt = gli;
    wAnt = W{ind};
    dWAnt{ind} = dW{ind}; 
    
end


end


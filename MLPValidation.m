function [y,Ta,mc] = MLPValidation( x,d,W,topg,fun,B)

[l cx] = size(x); % Dimensoes dos dados de entrada
X = {x};
U = {};

for i = 2:length(topg)
    X{end+1} =  zeros(l,topg(i)); % Cria as matrizes com valores nulos de acordo com a topologia
    U{end+1} =  zeros(l,topg(i)); % Cria as matrizes com valores nulos de acordo com a topologia
end
%%% FORWARD
   [X] = forward(X,W,U,B,topg,fun); % Executa a parte forward do algoritmo
   [y,Ta] = taxaAcerto(X{end},d); % Calculo da taxa de acerto no treinamento
   [mc] = matconf(y,d); % Calculo da matriz de confusão


end


function [y,Ta,mc] = KNN(k,x,d,x_teste,d_teste)

y = zeros(size(d_teste)); % cria uma matriz de resultados na mesma dimensão dos dados de teste com valores (zero)


for i=1:length(x_teste) % Para cada uma das amostras de teste
    dec = []; % Reinicia a matriz com as distancias euclidianas
    for j=1:length(x) % Para cada uma das amostras de treinamento
        aux = sqrt(sum((x_teste(i,:) - x(j,:)).^2)); % Distancia eulclidiana
        dec =[dec; [aux j]]; % Matriz com as distancia euclidianas para cada amostra dos dados de treino
    end
    aux2 = sortrows(dec,1); % Ordena a matriz em ordem crescente de distancias euclidianas
    soma = 0; % inicializa o somatorio
    for h=1:k
        soma = soma + d(aux2(h,2),:); % Soma os valores dos K vizinhos mais proximos
    end
    ind = find(max(soma) == soma); % Retorna o indice que representa a classe que tem mais vizinhos proximos
    y(i,ind) = 1; % adiciona (um) ao indice encontrad0, na matriz de resultados
end
    [yrn,Ta] = taxaAcerto(y,d_teste); % Calcula a taxa de acertos
    [mc] = matconf(y,d_teste); % Calcula a matriz de confusao



end


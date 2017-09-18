function [y,Ta,mc] = DMC(x,d,x_teste,d_teste)

[l c] = size(d_teste); % dimensões dos dados de teste

y = zeros(l,c); % cria uma matriz de resultados na mesma dimensão dos dados de teste com valores (zero)
centroids = []; % Vetor com os centroides de cada classe

% Calculo dos centroides
for i = 1:c % Verificando em todas as classes
    ind = find(d(:,i)== 1); % Retorna os indices de uma avaliação logica verdadeira
    aux = mean(x(ind,:)); % Retira a media de um conjuto de dados
    centroids = [centroids;aux]; % Concatena o centroide da classe ao vetor de centroides
end

dists = zeros(1,c); % Vetor com as distncias euclidianas ate os centroides

% Calcula a menor distancia entre os centroides
for i = 1:l
    for j = 1:c
        dists(j) = sqrt(sum((x_teste(i,:) - centroids(j,:)).^2)); % Distancia euclidiana
    end
    [m,ind] = min(dists); %Menor  Distancia
    y(i,ind) = 1; % Atribui o valor (um) no indice de menor distancia na matriz y
end

   [yrn,Ta] = taxaAcerto(y,d_teste); % Calcula a taxa de acertos
    [mc] = matconf(y,d_teste); % Calcula a matriz de confusao
end
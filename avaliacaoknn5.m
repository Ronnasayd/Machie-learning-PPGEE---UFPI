data = xlsread('ArquivosDeEntrada/dadosirisnorm.xls'); % Carrega os dados normalizados a partir do arquivo dadosirisnorm.xls
percentual = 0.1:0.1:0.8; % Vetor com os percentuais de treinamento variando de 10 a 80 por cento


acertos = []; % Matriz final com as Taxas de Acertos para cada um dos critérios pedidos para cada taxa de treinamento
matrizconfusao = []; % Matriz final com as matrizes de confusão para cada taxa de treinamento e cada uma das 20 vezes

for i = percentual % para a taxa de treinamento indo de 10 a 80 por cento
    aux1 = []; % Reinicia a matriz auxiliar
    aux2 = []; % Reinicia a matriz auxiliar
    for j = 1:20 % executar 20 vezes
        [x,d,x_teste,d_teste] = geraDadosIris(data,i); % Separa os dados para treinamento e teste
        [y,Ta,mc] = KNN(5,x,d,x_teste,d_teste); % Executa o algoritmo KNN para (5) Vizinhos mais próximos
        aux1 = [aux1 Ta]; % Concatena as Taxas de Acertos
        aux2 = [aux2 mc]; % Concatena as Matrizes de confusão
    end
    acertos = [acertos;[min(aux1),max(aux1),mean(aux1),sqrt(var(aux1))]]; % Seleciona os critérios pedidos e concatena na matriz final
    matrizconfusao = [matrizconfusao;aux2]; % Concatena as matrizes de confusão na matriz final
end

xlswrite('dadosGerados/KNN_5_Taxa_de_Acerto',acertos); % Salva a matriz final de Taxas de acertos com os critérios pedidos em um arquivo .xls
xlswrite('dadosGerados/KNN_5_Matriz_de_Confusão',matrizconfusao); % Salva a matriz final de confusões em um arquivo .xls

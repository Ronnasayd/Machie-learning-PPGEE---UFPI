data = xlsread('cardio_10c_norm.xls'); % Carrega os dados normalizados a partir do arquivo dadosirisnorm.xls
percentual = 0.1:0.1:0.8; % Vetor com os percentuais de treinamento variando de 10 a 80 por cento


acertos = []; % Matriz final com as Taxas de Acertos para cada um dos critérios pedidos para cada taxa de treinamento
matrizconfusao = []; % Matriz final com as matrizes de confusão para cada taxa de treinamento e cada uma das 20 vezes

e = 1e-5; % Critério de parada para as diferenças entre os erros médios quadráticos
epMax = 30000; % Quantidade máxima de épocas
top = [20]; % Topologia da rede (quantidade de camadas ocultas e quantos neuronios existem em cada camada)
fun = {@logistica  @logistica}; % Funções de ativação para cada camada da rede neural
B = {1,1}; % Parametros utilizados nas Funções de cada camada neural
n = 0.001; % Taxa de aprendizagem
m = 0.95; % Taxa de momentum

for i = percentual % para a taxa de treinamento indo de 10 a 80 por cento
    i
    aux1 = []; % Reinicia a matriz auxiliar
    aux2 = []; % Reinicia a matriz auxiliar
    for j = 1:20 % executar 20 vezes
        j
        [x,d,x_teste,d_teste] = geraDadosCardio(data,i); % Separa os dados para treinamento e teste
        [W,topg,epoca,erroEQM,EQMgraph] = MLP( x,d,n,m,top,fun,B,e,epMax); % Executa o algoritmo Backpropagation para ajuste dos pesos com os dados de treino
        [y,Ta,mc] = MLPValidation(x_teste,d_teste,W,topg,fun,B); % Valida a rede através dos dados de teste
        aux1 = [aux1 Ta]; % Concatena as Taxas de Acertos
        aux2 = [aux2 mc]; % Concatena as Matrizes de confusão
    end
    acertos = [acertos;[min(aux1),max(aux1),mean(aux1),sqrt(var(aux1))]]; % Seleciona os critérios pedidos e concatena na matriz final
    matrizconfusao = [matrizconfusao;aux2]; % Concatena as matrizes de confusão na matriz final
end

xlswrite('dadosGerados/MLP_Cardio_Taxa_de_Acerto',acertos); % Salva a matriz final de Taxas de acertos com os critérios pedidos em um arquivo .xls
xlswrite('dadosGerados/MLP_Cardio_Matriz_de_Confusão',matrizconfusao); % Salva a matriz final de confusões em um arquivo .xls

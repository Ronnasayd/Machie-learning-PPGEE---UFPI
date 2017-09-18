function [W,topg,epoca,erroEQM,EQMgraph,Ta,mc] = MLP(x,d,n,m,top,fun,B,e,epMax )
  

    [l cx] = size(x); % dimensoes dos dados de entrada
    [l cy] = size(d); % dimensoes dos dados de saida
    
    topg = [cx top cy]; %% Topologi da Rede MLP
    
    % Embaralha os dados de entrada
    a = randperm(l);
    x = x(a,:);
    d = d(a,:);

    W = {};  % Pesos
    dW = {}; % Termo de momentum
    dWAnt = {};% Termo de momentum para a epoca anterior
    X = {x}; % Saida de cada camada neural mais os dados de entrada da rede
    U = {}; % Potenciais de ativação para cada saída

    for i = 1:length(topg)-1 % indice resgressivo
        W{end+1} =  rand((topg(i)+1),topg(i+1)); % Cria as matrizes de pesos aleatorios na faixa de 0 a 1 de acordo com a topologia
        dW{end+1} = zeros((topg(i)+1),topg(i+1)); % Cria as matrizes com valores nulos de acordo com a topologia
        dWAnt{end+1} = zeros((topg(i)+1),topg(i+1)); % Cria as matrizes com valores nulos de acordo com a topologia
    end
    for i = 2:length(topg)
        X{end+1} =  zeros(l,topg(i)); % Cria as matrizes com valores nulos de acordo com a topologia
        U{end+1} =  zeros(l,topg(i)); % Cria as matrizes com valores nulos de acordo com a topologia
    end

    %%% FORWARD
        [X,U] = forward(X,W,U,B,topg,fun); % Executa a parte forward do algoritmo
        
        % Calculo dos erros
        er = d - X{end};
        EK =  sum(((er).^2)')'/2;
        EQM = sum(EK)/l;
        EQMAnt = 0;
        epoca = 0;
        erroEQM = abs(EQM - EQMAnt);
        EQMgraph = [EQM];
        

    while erroEQM > e && epoca < epMax % Enquanto criterios de paradas não forem satisfeitos excutar:
      %%% BACKWARD
       [W,dW,dWAnt] = backward(X,U,W,topg,fun,B,dW,dWAnt,er,n,m); % Executa a parte backward do algoritmo
        
       % Re-embaralha os dados de entrada
        a = randperm(l);
        x = x(a,:);
        d = d(a,:);
        X{1} = x;

      %%% FORWARD
        [X,U] = forward(X,W,U,B,topg,fun); % Executa a parte forward do algoritmo
        
        % Calculo dos erros
        EQMAnt = EQM;
        er = d - X{end};
        EK =  sum(((er).^2)')'/2;
        EQM = sum(EK)/l;
        epoca = epoca + 1;
        EQMgraph = [EQMgraph;EQM];
        erroEQM = abs(EQM - EQMAnt);
     
       [yrn,Ta] = taxaAcerto(X{end},d); % Calculo da taxa de acerto no treinamento
       [mc] = matconf(yrn,d); % Calculo da matriz de confusão
 
    end
       



end
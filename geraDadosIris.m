function [x,d,x_teste,d_teste] = geraDadosIris(data,taxa_treinamento)

l = length(data); %dimensão da quantidade de dados
quantidade_dados = floor(l*taxa_treinamento/3); %quantidade de dados retirada de cada classe para compor o treinamento

classe1 = data(1:50,:); % dados da classe 1
classe2 = data(51:100,:); % dados da classe 2
classe3 = data(101:end,:); % dados da classe 3

a = randperm(50); %  gera um vetor aleatorio com numeros de 1 a 50
classe1 = classe1(a,:); % embaralha os dados da classe 1
classe2 = classe2(a,:); % embaralha os dados da classe 2
classe3 = classe3(a,:); % embaralha os dados da classe 3

data_treino = [classe1(1:quantidade_dados,:);classe2(1:quantidade_dados,:);classe3(1:quantidade_dados,:)]; % acopla os dados das treis classe para compor o conjunto de treinamento
l = length(data_treino);
a = randperm(l);
data_treino = data_treino(a,:); % embaralha os dados do conjunto de treinamento
data_teste = [classe1(quantidade_dados+1:end,:);classe2(quantidade_dados+1:end,:);classe3(quantidade_dados+1:end,:)]; % acopla os dados das treis classes para compor o conjunto de teste
 %l = length(data_teste);
 %a = randperm(l);
%data_teste = data_teste(a,:); %embaralha os dados do conjunto de teste;

x = data_treino(:,1:4);
d = data_treino(:,5:end);
x_teste = data_teste(:,1:4);
d_teste = data_teste(:,5:end);

end


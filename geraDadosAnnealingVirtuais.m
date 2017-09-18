function [x,d,x_teste,d_teste] = geraDadosAnnealingVirtuais(data,taxa)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x = [];
d = [];
x_teste = [];
d_teste = [];
a = [ 8    88   608    34    60];

[l,c] = size(data);
qtdClasses = length(a);

classes = {};

for i = c-qtdClasses+1:c
    ind = find(data(:,i) == 1);
    classes{end+1}  = data(ind,:);
end


for i = 1:qtdClasses
    aux = randperm(round(l/5));
    aux2 = classes{i}(aux,:);
    qtd = round(taxa*round(l/5));
    
    %x = [x;aux2(1:qtd,1:c-qtdClasses)];
    x = [x;aux2(1:qtd,1:2)];
    d = [d;aux2(1:qtd,c-qtdClasses+1:end)];
    %x_teste = [x_teste;aux2(qtd+1:end,1:c-qtdClasses)];
    x_teste = [x_teste;aux2(qtd+1:end,1:2)];
    d_teste = [d_teste;aux2(qtd+1:end,c-qtdClasses+1:end)];
end

aux = randperm(length(x));
x = x(aux,:);
d = d(aux,:);


end


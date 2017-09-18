function [x,d,x_teste,d_teste] = geraDadosAnnealing(data,taxa)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x = [];
d = [];
x_teste = [];
d_teste = [];

a = [ 8    88   608    34    60];

a = [ 64    88   608    68    60];

qtdClasses = length(a);
[l,c] = size(data);
classes = {};

for i = c-qtdClasses+1:c
    ind = find(data(:,i) == 1);
    classes{end+1}  = data(ind,:);
end


for i = 1:length(a)
    aux = randperm(a(i));
    aux2 = classes{i}(aux,:);
    qtd = round(taxa*a(i));
    
    x = [x;aux2(1:qtd,1:c-qtdClasses)];
    d = [d;aux2(1:qtd,c-qtdClasses+1:end)];
    x_teste = [x_teste;aux2(qtd+1:end,1:c-qtdClasses)];
    d_teste = [d_teste;aux2(qtd+1:end,c-qtdClasses+1:end)];
    
end

aux = randperm(length(x));
x = x(aux,:);
d = d(aux,:);


end


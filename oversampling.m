data = xlsread('annealing7a');
qtdClasses = 5;
qtdDados = 700;
[l,c] = size(data);
a = [ 8    88   608    34    60];
b = qtdDados - a;

classes = {};

newData = [];

for i = c-qtdClasses+1:c
    ind = find(data(:,i) == 1);
    classes{end+1}  = data(ind,:);
end

aux = classes;

c = round(b./a);
d = b - round(b./a).*a;
d(find(d < 0)) = 0;
e = 700 - c.*a;
f = [e;b];
g =  min(f);

for i = 1:qtdClasses
    for j = 2:c(i)
        classes{i} = [classes{i}; aux{i}];
    end
    classes{i} = [classes{i};aux{i}(randperm(g(i)),:)];
    newData = [newData;classes{i}];
end



  xlswrite('annealing7aoversampling',newData);



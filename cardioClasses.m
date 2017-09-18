data = xlsread('cardio_3c');
qtdClasses = 3;

cla = [];
a = [];
for i = 1:qtdClasses
    ind = find(data(:,end) == i);
    aux = zeros(length(ind),10);
    aux(:,i) = 1;
    cla = [cla;aux];
    a = [a length(ind)];
end
newData = [data(:,1:end-1) cla];
newData = normalization(newData,[0 1]);
xlswrite('cardio_3c_norm',newData)
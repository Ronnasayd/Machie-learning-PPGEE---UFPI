data = xlsread('annealingpcanormalizado');

qtdDados = 1000;

a = [ 8    88   608    34    60];
b = qtdDados - a;

classes = {};

newData = [];

for i = 9:13
    ind = find(data(:,i) == 1);
    classes{end+1}  = data(ind,:);
end

for i=1:5
    %mi = min(classes{i});
    %ma = max(classes{i});
    u = mean(classes{i});
    dp = sqrt(var(classes{i}));
    for j = 1:b(i)
       % val = mi + (ma - mi)*rand;
        val = u + dp.*(rand(1,13) - 0.5)/0.5;
        classes{i} = [classes{i}; val];
    end
    newData = [newData;classes{i}];
end

  xlswrite('annealingpcanormalizadoextendido',newData);



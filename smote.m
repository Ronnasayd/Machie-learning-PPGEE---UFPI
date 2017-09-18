
%%SMOTE
data = xlsread('annealing13_norm');

% x = data(:,4:6);
% data = [x data(:,end-qtdClasses+1:end)]
[l,c] = size(data);
T = [ 8    88   608    34    60]; 
qtdClasses = length(T);
x = data(:,1:end-qtdClasses);
[lx,cx] = size(x);
indices = [1  8; 9  96; 97 704; 705 738; 739 798];
K = 5;
qtdDados = 610;
T2 = qtdDados - T;
T3 = floor(T2./T);
T4 = qtdDados - (T3.*T + T);

knn = [];
for i=1:length(x)
    dec = [];
    for j=1:length(x)
        if i ~= j
            aux = sqrt(sum((x(i,:) - x(j,:)).^2));
            dec =[dec; [aux j]];
        end
    end
    aux2 = sortrows(dec,1);
    knn = [knn; [i aux2(1:K,2)']];
end

newSamples = [];
for i = 1:qtdClasses
    newSamples = [newSamples;data(indices(i,1):indices(i,2),:)];
    for j = 1:T3(i)
        for k = indices(i,1):indices(i,2)
            ind1 = randi(K) + 1;
            ind2 = knn(k,ind1);
            diff = x(ind2,:) - x(k,:);
            sample = x(k,:) + diff.*rand(1,cx);
            
            aux = data(k,end-qtdClasses+1:end);
            newSamples = [newSamples;[sample aux]];
        end
    end
    
    for j = 1:T4(i)
        ind1 = randi([indices(i,1) indices(i,2)]);
        ind2 = randi(K) + 1;
        ind3 = knn(ind1,ind2);
        diff = x(ind3,:) - x(ind1,:);
        sample = x(ind1,:) + diff.*rand(1,cx);
        aux = data(ind1,end-qtdClasses+1:end);
        newSamples = [newSamples;[sample aux]];
    end
        
end

xlswrite('annealing13_norm_smote',newSamples);
newSamples = normalization(newSamples,[0 1]);
xlswrite('annealing13_norm_smote_norm',newSamples);


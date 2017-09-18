k = 3;
p = 0.1;
data = xlsread('dadosirisnorm');
[l,c] = size(data);
data = data(randperm(l),:);
trainigData = data(1:floor(p*l),:);
testeData = data(floor(p*l)+1:end,:);
resultTesteData = testeData;

% color = {'ro','bo','go'};
%  for j = 1:l
%      aux = data(j,end-2:end);
%      ind = find(max(aux) == aux);
%      plot(data(j,2),data(j,4),color{ind})
%      hold on
%        
% end

for i=1:l-floor(p*l)
    dec = [];
    for j = 1:floor(p*l)
        aux = sqrt(sum((testeData(i,:) - trainigData(j,:)).^2));
        dec =[dec; [aux j]];
    end
    aux2 = sortrows(dec);
    soma = 0;
    for h=1:k
        soma = soma + trainigData(aux2(h,2),end-2:end);
    end
    aux3 = zeros(1,3);
    ind = find(max(soma) == soma);
    aux3(ind) = 1;
    resultTesteData(i,end-2:end) = aux3;
    dec = [];
end
% figure;
%  for j = 1:l
%      aux = data(j,end-2:end);
%      ind = find(max(aux) == aux)
%      plot(data(j,1),data(j,2),color{ind})
%      hold on
%        
% end
% figure;
%  for j = 1:l-floor(p*l)
%      aux = resultTesteData(j,end-2:end);
%      ind = find(max(aux) == aux)
%      plot(resultTesteData(j,1),resultTesteData(j,2),color{ind})
%      hold on
%        
% end

v =  sum(sum(testeData(:,end-2:end) .* resultTesteData(:,end-2:end)));
ta = 100*( v)/(l - floor(p*l))
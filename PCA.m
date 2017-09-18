function [T,t,newData,dataAux] = PCA(data)
u = mean(data);
[l,c] = size(data);
dataAux = zeros(l,c);
for i = 1:l
    dataAux(i,:) = data(i,:) - u;
end
C = cov(dataAux);
[T,t] = eig(C);
t2 = zeros(c);
T2 = zeros(c);

for i = 1:c
    t2(:,i) = t(:,c-i+1);
    T2(:,i) = T(:,c-i+1);
end
T = T2;
t = t2;

newData = dataAux*T;
    

end


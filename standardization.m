function [ newData ] = standardization( data)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

l = length(data);
newData = zeros(size(data));
u = mean(data);
sigma = sqrt(var(data));

for i = 1:l
    newData(i,:) = (data(i,:) - u)./sigma;
end

end


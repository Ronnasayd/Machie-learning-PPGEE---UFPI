function [ newData ] = normalization( data , lim)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

l = length(data);

newData = zeros(size(data));
ma = max(data);
mi = min(data);

for i = 1:l
    newData(i,:) = ((data(i,:) - mi)./(ma - mi))*(lim(2) - lim(1)) + lim(1);
end

end


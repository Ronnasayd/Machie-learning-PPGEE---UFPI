% fun��o linear
function [y,dy] = linearN(B,u)
y = u;
[l,c] = size(u);
dy = B*ones(l,c);
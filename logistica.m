% fun��o logistica
function [y,dy] = logistica(B,u)
y = 1./(1 + exp(-B*u));
dy = B*exp(-B*u)./((1  + exp(-B*u)).^2);

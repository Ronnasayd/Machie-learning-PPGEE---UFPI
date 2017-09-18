% fun��o tangente hiperb�lica
function [y,dy] = tanhiper(B,u)
y = (1 - exp(-B*u))./(1 + exp(-B*u));
dy = (2*B*exp(B*u))./((exp(B*u) + 1).^2);
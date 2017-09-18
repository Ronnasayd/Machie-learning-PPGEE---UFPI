% fun��o gaussiana
function [y,dy] = gaussiana(B,u)
    y = exp(-((u - B(1)).^2)./(2*B(2).^2));
    dy = ((B(1) - u)./B(2)).*y;
function [yrn,Ta] = taxaAcerto(y,d)
    [l,c]= size(d);
    yrn = zeros(size(y));
    
    % Vencedor leva tudo
    for i=1:l
        [aux,ind] = max(y(i,:));
        yrn(i,ind) = 1;
    end
    
    % Calculo da taxa de acertos
    a = abs(yrn - d);
    a = sum(a')';
    a = a > 0;
    a = sum(a);
    Ta = 100*(l - a)/l;
    


end


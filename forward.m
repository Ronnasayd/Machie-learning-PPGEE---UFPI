function [X,U] = forward(X,W,U,B,topg,fun)

[l,c] = size(X{1});% Dimensão dos dados de entrada
for i = 1:length(topg)-1
    U{i} = potencial2([-ones(l,1) X{i}],W{i}'); %% potencial de x(k) e w(k)
    X{i+1} = fun{i}(B{i},U{i}); %% x(k+1) = g(x(k)*w(k+1)')
end

end


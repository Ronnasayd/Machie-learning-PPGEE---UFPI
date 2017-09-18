function [mc] = matconf(y,d)

[l,c] = size(d); % dimensoes dos dados
mc = zeros(c);% Matriz de confusão

for i = 1:c % para cada uma das classes
    ind = find(d(:,i) == 1); % seleciona os indices da classe n
    for j =1:c % para cada uma das classes
        aux = find(y(ind,j) == 1);% Correspondencia entre cada uma das classes e classe selecionada
        mc(i,j) = length(aux); % quantidade de elementos encontrados em cada classe
    end
end

end


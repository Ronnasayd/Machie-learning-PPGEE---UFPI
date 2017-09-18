data = xlsread('cardio_10c_norm_med_pca_norm');


color1 = [0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 0 0 0; 0.8 0.8 0.2; 0.5 0.5 0.5; 0.2 0.8 0.7; 0.78 0.23 0.85];
%color1 = [0 0 1; 1 0 0; 0 1 0];

names = {'c1','c2','c3','c4','c5','c6','c7','c8','c9','c10'};
element = '*';
ind1 = 1;
ind2 = 2;
qtdClasses = 10;
[l,c] = size(data);
markersize = 3;


% for k = 1:c-qtdClasses
%     for h=k:c-qtdClasses
%         if(k ~= h)
%             for i = 1:qtdClasses
%                 ind = find(data(:,i+c-qtdClasses) == 1);
%                 plot(data(ind,k),data(ind,h),color1{i})
%                 plot(data(ind,k),data(ind,h),color2{i})
%                 hold on
%             end
%             title(k*10+h)
%             axis([-0.2 1.2 -0.2 1.2])
%             pause
%             close
%         end
%     end
%   
% end


for k = 1:c-qtdClasses
    for h=k:c-qtdClasses
        for j = h:c-qtdClasses
        if(k ~= h && k~= j && j ~= h)
            for i = 1:qtdClasses
                ind = find(data(:,i+c-qtdClasses) == 1);
                subplot(2,2,1);
                title(sprintf('Atributos: %i X %i X %i',k,h,j))
                plot3(data(ind,k),data(ind,h),data(ind,j),element,'color',color1(i,:),'MarkerSize',markersize);
                hold on
                grid on
                axis([-0.5 1.5 -0.5 1.5 -0.5 1.5])
                xlabel(sprintf('Atributo %i',k))
                ylabel(sprintf('Atributo %i',h))
                zlabel(sprintf('Atributo %i',j))
                
                
                subplot(2,2,2);
               title(sprintf('Atributos: %i X %i',k,h))
                plot(data(ind,k),data(ind,h),element,'color',color1(i,:),'MarkerSize',markersize)
                hold on
                grid on
                axis([-0.5 1.5 -0.5 1.5])
                xlabel(sprintf('Atributo %i',k))
                ylabel(sprintf('Atributo %i',h))
          
                
                subplot(2,2,3);
                title(sprintf('Atributos: %i X %i',k,j))
                plot(data(ind,k),data(ind,j),element,'color',color1(i,:),'MarkerSize',markersize)
                hold on
                grid on
                axis([-0.5 1.5 -0.5 1.5 -0.5 1.5])
                xlabel(sprintf('Atributo %i',k))
                ylabel(sprintf('Atributo %i',j))
                
                subplot(2,2,4);
                title(sprintf('Atributos: %i X %i',h,j))
                plot(data(ind,h),data(ind,j),element,'color',color1(i,:),'MarkerSize',markersize)
                hold on
                grid on
                axis([-0.5 1.5 -0.5 1.5 -0.5 1.5])
                xlabel(sprintf('Atributo %i',h))
                ylabel(sprintf('Atributo %i',j))
                
               

            end
            legend(names);
            %saveas(gcf,sprintf('imagens_cardio_10/Atributos_%iX%iX%i.jpg',k,h,j))
            pause
%             close
        end
        end
    end
  
end
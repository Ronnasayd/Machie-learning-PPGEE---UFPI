 data = xlsread('cardio_10c_norm');
 
  a = [];
  qtdClasses = 10;
  [l,c] = size(data);
  classes = {};
  for i = c-qtdClasses+1:c
      ind = find(data(:,i) == 1);
      a = [a length(ind)];
      aux = data(ind,:);
      classes{end+1} = aux;
  end
  
  u = mean(data);
  newData = [];
  for i=1:length(classes)
      %u = mean(classes{i});
      for j = 1:c-qtdClasses
          ind = find(classes{i}(:,j) == 0);
          classes{i}(ind,j) = u(j);;
      end
      newData = [newData;classes{i}];
  end
  
  xlswrite('cardio_10c_norm_med',newData);
 
  
 
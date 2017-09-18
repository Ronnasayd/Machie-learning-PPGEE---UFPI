data = xlsread('cardio_10c_norm_med');
[l,c] = size(data);
qtdClasses = 10;
x = data(:,1:c-qtdClasses);
[T,t,newData,dataAux] = PCA(x);
data(:,1:c-qtdClasses) = newData;
xlswrite('cardio_10c_norm_med_pca',data);
data = normalization(data,[0 1]);
xlswrite('cardio_10c_norm_med_pca_norm',data);
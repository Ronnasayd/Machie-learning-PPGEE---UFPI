data = xlsread('cardio_10c_norm_pca_norm.xls');
taxa = 0.6;
[x,d,x_teste,d_teste] = geraDadosCardio(data,taxa);
[y2,Ta2,mc2] = KNN(5,x,d,x_teste,d_teste);
% [y4,Ta4,mc4] = DMC(x,d,x_teste,d_teste);
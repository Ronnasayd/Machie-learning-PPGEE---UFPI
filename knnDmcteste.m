data = xlsread('dadosirisnorm.xls');
taxa = 0.1;
[x,d,x_teste,d_teste] = geraDadosIris(data,taxa);
[y2,Ta2,mc2] = KNN(3,x,d,x_teste,d_teste);
 [y4,Ta4,mc4] = DMC(x,d,x_teste,d_teste);
clc;
clear;
data = xlsread('dadosirisnorm.xls');
percentual = 0.1:0.1:0.8;

e = 1e-5;
epMax = 20000;
top = [15];
fun = {@logistica  @linearN};
B = {1 1};
n = 0.001;
m = 0.8;


minimos = [];
maximos = [];
medias = [];
desvios = [];

for i = percentual
    i
    erros = [];
    for j = 1:20
        [x,d,x_teste,d_teste] = geraDadosIris(data,i);
        [y1,Ta1,mc1] = KNN(1,x,d,x_teste,d_teste);
        [y2,Ta2,mc2] = KNN(3,x,d,x_teste,d_teste);
        [y3,Ta3,mc3] = KNN(5,x,d,x_teste,d_teste);
        [y4,Ta4,mc4] = DMC(x,d,x_teste,d_teste);
        [W,topg,epoca,erroEQM,EQMgraph,Ta] = MLP( x,d,n,m,top,fun,B,e,epMax);
        [y5,Ta5,mc5] = MLPValidation(x_teste,d_teste,W,topg,fun,B)
        
        erros = [erros;[Ta1 Ta2 Ta3 Ta4 Ta5]];
    end
    minimos = [minimos;[i*10 min(erros)]];
    maximos = [maximos;[i*10 max(erros)]];
    medias = [medias;[i*10 mean(erros)]];
    desvios = [desvios;[i*10 sqrt(var(erros))]];
end

xlswrite('minimosavaliacao1',minimos);
xlswrite('maximosavaliacao1',maximos);
xlswrite('mediasavaliacao1',medias);
xlswrite('desviosavaliacao1',desvios);
        

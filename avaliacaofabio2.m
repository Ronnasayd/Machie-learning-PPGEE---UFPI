clc;
clear;
data = xlsread('annealingmediasnormalizadasextendidas.xls');
percentual = 0.3;

e = 1e-6;
epMax = 20000;
top = [10];
fun = {@logistica @logistica};
B = [1 1];
n = 0.01;

minimos = [];
maximos = [];
medias = [];
desvios = [];

for i = percentual
    i
    erros = [];
    for j = 1:20
        [x,d,x_teste,d_teste] = geraDadosAnnealingVirtuais(data,i);
        [W,topg,epoca,erroeqm,eqmgraph] = MLP( x,d,n,top,fun,B,e,epMax );
        [y5,yrn,em5] = MLPValidation( x_teste,d_teste,W,topg,fun,B);
        
        erros = [erros; em5];
        
    end
        minimos = [minimos;[i*10 min(erros)]];
        maximos = [maximos;[i*10 max(erros)]];
        medias = [medias;[i*10 mean(erros)]];
        desvios = [desvios;[i*10 sqrt(var(erros))]];
        
    end
    
    xlswrite('minimosavaliacao2',minimos);
    xlswrite('maximosavaliacao2',maximos);
    xlswrite('mediasavaliacao2',medias);
    xlswrite('desviosavaliacao',desvios);
    

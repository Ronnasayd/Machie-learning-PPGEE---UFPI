
%data = xlsread('annealing7asmotepcanormalization.xls');
data = xlsread('annealing13_norm_ext');
taxa  =  0.6;
%[x,d,x_teste,d_teste] = geraDadosAnnealingVirtuais(data,taxa);
[x,d,x_teste,d_teste] = geraDadosAnnealing(data,taxa);

e = 1e-5;
epMax = 30000;
top = [3];
fun = {@logistica @logistica};
B = {1,1};
n = 0.01;
m = 0.9;

aux = [];
[W,topg,epoca,erroEQM,EQMgraph,Ta,mc] = MLP( x,d,n,m,top,fun,B,e,epMax );
for i = 1:20
    [x,d,x_teste,d_teste] = geraDadosAnnealing(data,taxa);
[y,Ta,mc] = MLPValidation( x_teste,d_teste,W,topg,fun,B);
aux = [aux;Ta];
end


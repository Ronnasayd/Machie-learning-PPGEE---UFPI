%data = xlsread('annealing7asmotepcanormalization.xls');
data = xlsread('cardio_10c_norm.xls');
taxa  =  0.5;
%[x,d,x_teste,d_teste] = geraDadosAnnealingVirtuais(data,taxa);
[x,d,x_teste,d_teste] = geraDadosCardio(data,taxa);

e = 1e-5;
epMax = 30000;
top = [20];
fun = {@logistica @logistica};
B = {1,1};
n = 0.001;
m = 0.95;

[W,topg,epoca,erroEQM,EQMgraph,Ta,mc] = MLP(x,d,n,m,top,fun,B,e,epMax );
[y,Ta,mc] = MLPValidation(x_teste,d_teste,W,topg,fun,B);
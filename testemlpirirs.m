
data = xlsread('dadosirisnorm.xls');
taxa  =  0.2;
[x,d,x_teste,d_teste] = geraDadosIris(data,taxa);

e = 1e-5;
epMax = 20000;
top = [15];
fun = {@logistica  @linearN};
B = {1 1};
n = 0.001;
m = 0.8;

[W,topg,epoca,erroEQM,EQMgraph,Ta] = MLP( x,d,n,m,top,fun,B,e,epMax );
[y,Ta,mc] = MLPValidation(x,d,W,topg,fun,B);

function y = calc_fx(x1,x2,x3)
%---------------------------------------------------------------------------
% DESCRIÇÃO: calcula o valor da função em um ponto
% INPUT: 
% f = (2*x1*x2-2)^2 + (x2-x3)^2 + (x2+2*x3-5)^4;
% var1 = primeira variavel de f(x)
% var2 = segunda variavel de f(x)
% var3 = terceira variavel de f(x)
% OUTPUT:
% y = valor da função no ponto [x1 x2 x3]
%---------------------------------------------------------------------------
y = (2*x1*x2-2)^2 + (x2-x3)^2 + (x2+2*x3-5)^4;


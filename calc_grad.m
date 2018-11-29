function [y] = calc_grad(f,var1,var2,var3,a,b,c)
%---------------------------------------------------------------------------
% DESCRIÇÃO: calcula o gradiente de uma funçao
% INPUT: 
% f = funçao simbolica
% f = (2*x1*x2-2)^2 + (x2-x3)^2 + (x2+2*x3-5)^4;
% var1 = primeira variavel de f(x)
% var2 = segunda variavel de f(x)
% var3 = terceira variavel de f(x)
% a = valor numerico relativo à variavel simbolica var1 do gradiente de f(x)
% b = valor numerico relativo à variavel simbolica var2 do gradiente de f(x)
% c = valor numerico relativo à variavel simbolica var3 do gradiente de f(x)
% OUTPUT:
% y = vetor na forma [x y z]
%---------------------------------------------------------------------------

%funcao que determina simbolicamente o gradiente de f(x)
grad_f = gradient(f,[var1 var2 var3]);

%calculo do gradiente no ponto [a,b,c]
y = double(subs(grad_f,[var1 var2 var3],[a b c]));



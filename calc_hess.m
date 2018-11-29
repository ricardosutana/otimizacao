function [y] = calc_hess(f,var1,var2,var3,a,b,c)
%---------------------------------------------------------------------------
% DESCRIÇÃO DA FUNCAO: Calcula a matriz hessiana de uma função
% ENTRADA:
% f = funçao simbolica
% f = (2*x1*x2-2)^2 + (x2-x3)^2 + (x2+2*x3-5)^4;
% var1 = primeira variavel de f(x)
% var2 = segunda variavel de f(x)
% var3 = terceira variavel de f(x)
% a = valor numerico relativo à variavel simbolica var1 da hessiana de f(x)
% b = valor numerico relativo à variavel simbolica var2 da hessiana de f(x)
% c = valor numerico relativo à variavel simbolica var3 da hessiana de f(x)
% SAIDA: 
% y = vetor coluna contendo os valores calculados
%---------------------------------------------------------------------------

%funcao que determina simbolicamente a hessiana de f(x)
hess_f = hessian(f,[var1 var2 var3]);

%calculo do gradiente no ponto [a,b,c]
y = double(subs(hess_f,[var1 var2 var3],[a b c]));

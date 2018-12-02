function [y] = calc_hess(f,var,pto)
%---------------------------------------------------------------------------
% DESCRI��O DA FUNCAO: Calcula a matriz hessiana de uma fun��o
% ENTRADA:
% f = fun�ao simbolica
% f = (2*x1*x2-2)^2 + (x2-x3)^2 + (x2+2*x3-5)^4;
% var1 = primeira variavel de f(x)
% var2 = segunda variavel de f(x)
% var3 = terceira variavel de f(x)
% a = valor numerico relativo � variavel simbolica var1 da hessiana de f(x)
% b = valor numerico relativo � variavel simbolica var2 da hessiana de f(x)
% c = valor numerico relativo � variavel simbolica var3 da hessiana de f(x)
% SAIDA: 
% y = vetor coluna contendo os valores calculados
%---------------------------------------------------------------------------

if nargin ==2
    %funcao que determina simbolicamente a hessiana de f(x)
    hess_f = hessian(f,[var(1,1) var(2,1) var(3,1)]);
    y = hess_f;
else
    %funcao que determina simbolicamente a hessiana de f(x)
    hess_f = hessian(f,[var(1,1) var(2,1) var(3,1)]);
    %calculo do gradiente no ponto [a,b,c]
    y = double(subs(hess_f,[var(1,1) var(2,1) var(3,1)],[pto(1,1) pto(2,1) pto(3,1)]));
end
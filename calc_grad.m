function [y] = calc_grad(f,var,pto)
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
grad_f = gradient(f,[var(1,1) var(2,1) var(3,1)]);

% Verifica se o numero de argumentos passado para a funcao calc_grad for
%igual a 2(f,var) retorna a funcao em forma simbolica
 
if nargin == 2
    y= grad_f;
%caso contrario retorna o valor da funão no ponto a b c
else 
 %calculo do gradiente no ponto [a,b,c]
 y = double(subs(grad_f,[var(1,1) var(2,1) var(3,1)],[pto(1,1) pto(2,1) pto(3,1)]));
end


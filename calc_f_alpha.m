 function [y] = calc_f_alpha(x,dir,val)
 %---------------------------------------------------------------------------
% DESCRIÇÃO DA FUNCAO: Calcula o valor da função unidimensional f(alpha)
% ENTRADA:
%
%     [ x1 ]
% x = | x2 | = vetor que contem os pontos do vetor x
%     [ x3 ] 
%
%     [ dx1 ]
% d = | dx2 | = vetor que contem a direçao de descida
%     [ dx3 ]
%
% val = valor a ser avaliado
%
% SAIDA: 
% y = valor de f(val)
%---------------------------------------------------------------------------

%Funcao de teste, vide slides prof Luciana
%y = 10 + 2*val^4 - 4*val^2;
%chamar no prompt buscaFibonaci(1.5,d0,0.3,x0)

%Funcao f(alpha)
y = ((2*(x(1,1)+val*dir(1,1)))*(x(2,1)+val*dir(2,1)))^2 + ...
    ((x(2,1)+val*dir(2,1))+(x(3,1)+val*dir(3,1)))^2 +...
    ((x(2,1)+val*dir(2,1))+(x(3,1)+val*dir(3,1))-5)^4;    
      
f_a = ((2*(x1+a*d))*(x2+a*d))^2 + ((x2+a*d)+(x3+a*d))^2 +
f'(a) = 4*d*(x2 + x3 + 2*a*d) + 8*d*(x2 + x3 + 2*a*d - 5)^3 + 4*d*(2*x1 + 2*a*d)*(x2 + a*d)^2 + 2*d*(2*x1 + 2*a*d)^2*(x2 + a*d)

f''(a) = 8*d^2*(x2 + a*d)^2 + 8*d^2 + 2*d^2*(2*x1 + 2*a*d)^2 + 48*d^2*(x2 + x3 + 2*a*d - 5)^2 + 16*d^2*(2*x1 + 2*a*d)*(x2 + a*d)
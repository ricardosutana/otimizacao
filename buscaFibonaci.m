function alpha = buscaFibonaci(alpha_bar,d,tol,x)
%------------------------------------------------------
% DESCRICAO: Metodo de busca unidimensional Fibonaci
% INPUT:
% alpha_bar: valor do limite superior do intervalo[0,alpha_bar)
%
%     [ dx1 ]
% d = | dx2 | = vetor que contem a direçao de descida
%     [ dx3 ]
%  
% tol = valor final do intervalo de incerteza
%
%    [ x1 ]
% x= | x2 | = vetor que contem os pontos do vetor x
%    [ x3 ] 
%OUTPUT:
% alpha:  
%------------------------------------------------------

tic

%funcao f(x+alpha*d)
%f_alpha = [2*(x1+alpha*dx1)*(x2+alpha*dx2)]^2 + [(x2+alpha*dx2)+(x3+alpha*dx3))]^2 + [(x2+alpha*dx2)+(x3+alpha*dx3)-5]^4;

%valor da sequencia fibonacci
Fn = alpha_bar/tol;

%construção do vetor fibonacci 
%OBS1: o vetor se inicia com inidce 1(um)
%-------------|------------------------------------------------------------
%     n      =|1 2  3  4  5  6  7  8  9  10  11  12   13   14   15   16 ...
%fibonacci(n)=|1 1  2  3  5  8  13 21 34 55  89  144  233  377  610  987...
%-------------|------------------------------------------------------------

%% Busca pelo valor Fn
i = 2;
fib(1) = 1;
fib(2) = 1;

while(fib(i) <= Fn)
    i=i+1;
    fib(i) = fib(i-1)+fib(i-2);
end

%indice relativo ao numero fibonacci Fn
% OBS: o metodo de busca começa com indice 0 por isso foi subtraido uma uni
% dade do indice
index_fib = length(fib);

%% Determinação dos intervalos
%intervalo inicial: [0,alpha_bar]
a=0; 
b=alpha_bar;

%regulador de iteraçoes
k = 1;

%iteracao de busca dos intervalos
while(k<index_fib-1)
 
 
 %verifica os proximos intervalos
 lambida_k = a + (fib(index_fib-k-1)/fib(index_fib-k+1))*(b-a);
 
 u_k = a + (fib(index_fib-k)/fib(index_fib-k+1))*(b-a);
 
 %calcula o valor da função para os novos limites calculados
 f_lambidak = calc_f_alpha(x,d,lambida_k);
 
 f_uk = calc_f_alpha(x,d,u_k);
 
 %testa e atribui os novos pontos
 if(f_lambidak > f_uk)
     a = lambida_k;
     b = b;
 else
     a = a;
     b = u_k;
 end
 k = k+1;
end

alpha = (lambida_k+u_k)/2;

% Caso tenha alguma duvida verificar BAZARAA,et. al. Nonlinear Programmim
% Theory and Algorithms,3rd Edition p.351
toc
function y  = buscaNewton(d,x,tol,alpha0,simb)
%------------------------------------------------------
% DESCRICAO: Metodo de busca unidimensional de Newton
% INPUT:
% 
%
%     [ dx1 ]
% d = | dx2 | = vetor que contem a direçao de descida
%     [ dx3 ]
%  
%
%    [ x1 ]
% x= | x2 | = vetor que contem os pontos do vetor x
%    [ x3 ] 
%
% tol = valor final do intervalo de incerteza
%
% alpha0 = valor inicial qualquer para iniciar a busca
% sim = variavel da funçao
% OUTPUT:
% alpha: = valor minimo da função f(alpha)  
%------------------------------------------------------
tic
syms alpha;

alpha = simb;

%% Função theta(alpha)
f_alpha = ((2*(x(1,1)+alpha*d(1,1)))*(x(2,1)+alpha*d(2,1)))^2 + ...
              ((x(2,1)+alpha*d(2,1))+(x(3,1)+alpha*d(3,1)))^2 + ...
              ((x(2,1)+alpha*d(2,1))+(x(3,1)+alpha*d(3,1)-5))^4;

%theta_alpha = (4*(alpha^3)-(3*(alpha^4)));
%% Derivada primeira de thetha(alpha)
f_1_alpha = gradient(f_alpha,alpha);
%theta_1_alpha = 2*(dx2 + dx3)*(x2 + x3 + alpha*dx2 + alpha*dx3) + 4*(dx2 + dx3)*(x2 + x3 + alpha*dx2 + alpha*dx3 - 5)^3 + 4*dx1*(2*x1 + 2*alpha*dx1)*(x2 + alpha*dx2)^2 + 2*dx2*(2*x1 + 2*alpha*dx1)^2*(x2 + alpha*dx2)

%% Derivada segunda de theta(alpha)
f_2_alpha = gradient(f_1_alpha,alpha);
%theta_2_alpha = 8*dx1^2*(x2 + alpha*dx2)^2 + 2*(dx2 + dx3)^2 + 2*dx2^2*(2*x1 + 2*alpha*dx1)^2 + 12*(dx2 + dx3)^2*(x2 + x3 + alpha*dx2 + alpha*dx3 - 5)^2 + 16*dx1*dx2*(2*x1 + 2*alpha*dx1)*(x2 + alpha*dx2)


%% Loop

%este valor acumula o numero de iteraçoes
k=1;

%o primeiro valor de alpha é o inicial que foi passado
alpha_k = alpha0;

%variaveis temporarias que armazenam o valor calculadas para a primeira e
%segunda derivadas
temp1 = double(subs(f_1_alpha,alpha,alpha_k));
temp2 = double(subs(f_2_alpha,alpha,alpha_k));

%proximo alpha
alpha_k1 = alpha_k - temp1/temp2; 

 while(abs(alpha_k1-alpha_k)>tol)
     k=k+1;
     %atualiza o valor do alpha atual
     alpha_k = alpha_k1;
     %variaveis temporarias
     temp1 = double(subs(f_1_alpha,alpha,alpha_k));
     temp2 = double(subs(f_2_alpha,alpha,alpha_k));
     %atualiza proximo alpha
     alpha_k1 = alpha_k - temp1/temp2;
 
 end
%rotorno da função
fprintf('Numero de Iteraçoes:%d \n',k) 
y= alpha_k1;
 
 toc


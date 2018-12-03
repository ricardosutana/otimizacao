function y = buscaFalsaPosicao(d,x,tol,a,b,simb)

%------------------------------------------------------
% DESCRICAO: Metodo de busca unidimensional de Falsa Posi��o
% OBS: Neste m�todo � necess�rio passar dois pontos onde se acredita que o
%      m�nimo se encontra. A partir destes pontos o minimo eh determinado
% 
% INPUT:
% 
%
%     [ dx1 ]
% d = | dx2 | = vetor que contem a dire�ao de descida
%     [ dx3 ]
%  
%
%     [ x1 ]
% x = | x2 | = vetor que contem os pontos do vetor x
%     [ x3 ] 
%
% tol = valor final do intervalo de incerteza
%
% alpha0 = valor inicial qualquer para iniciar a busca
%
% a = valor m�nimo do intervalo
%
% b = valor m�ximo do intervalo
%
% sim = variavel da fun�ao
%
% OUTPUT:
%
% alpha: = valor minimo da fun��o f(alpha)  
%------------------------------------------------------

tic
%variavel simbolica para deriva�ao
syms alpha;
% atribui�ao da variavel simbolica para uma variavel local
alpha = simb;

%% Fun��o theta(alpha)
f_alpha = ((2*(x(1,1)+alpha*d(1,1)))*(x(2,1)+alpha*d(2,1)))^2 + ...
              ((x(2,1)+alpha*d(2,1))+(x(3,1)+alpha*d(3,1)))^2 + ...
              ((x(2,1)+alpha*d(2,1))+(x(3,1)+alpha*d(3,1)-5))^4;


%% Derivada primeira de thetha(alpha)

f_1_alpha = gradient(f_alpha,alpha);
%theta_1_alpha = 2*(dx2 + dx3)*(x2 + x3 + alpha*dx2 + alpha*dx3) + 4*(dx2 + dx3)*(x2 + x3 + alpha*dx2 + alpha*dx3 - 5)^3 + 4*dx1*(2*x1 + 2*alpha*dx1)*(x2 + alpha*dx2)^2 + 2*dx2*(2*x1 + 2*alpha*dx1)^2*(x2 + alpha*dx2)


%% Loop iterativo
%menor valor de alpha inicial 
alpha_ant=a;

%maior valor de alpha inicial
alpha_atual=b;

%proximo alpha
alpha_prox = alpha_atual - (double(subs(f_1_alpha,alpha,alpha_atual)))*((alpha_ant - alpha_atual)/((double(subs(f_1_alpha,alpha,alpha_ant)))-(double(subs(f_1_alpha,alpha,alpha_atual)))));

%erro entre o proximo valor de alpha com o valor atual de alpha
erro = abs(alpha_prox-alpha_atual);

%variavel para contagem das iteracoes
k=1;

%loop
while (erro>tol)
    %incrementa k
    k=k+1;
    %troca dos valores de alpha
    alpha_ant = alpha_atual;
    alpha_atual = alpha_prox;
    alpha_prox = alpha_atual - (double(subs(f_1_alpha,alpha,alpha_atual)))*((alpha_ant - alpha_atual)/((double(subs(f_1_alpha,alpha,alpha_ant)))-(double(subs(f_1_alpha,alpha,alpha_atual)))));
    %calculo do erro
    erro = abs(alpha_prox-alpha_atual);
end
%impressao do numero de itera�oes, valor de alpha e tempo
fprintf('Numero de Itera�oes:%d \n',k)

y = alpha_prox;

toc
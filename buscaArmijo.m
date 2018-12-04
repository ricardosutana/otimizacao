function y = buscaArmijo(d,x,epsilon,eta,alpha0,simb)
%% Fun��o busca Armijo
% DESCRI��O
% theta(alpha)<= teta(0) + epsilon*theta'(0)*alpha  (24)
%
% Sometimes in practice, the Armijo test is used to define a simplified 
% search technique that does not employ curve fitting methods. One begins
% with an arbitrary % alpha. If it satisfies (24), it is repeatedly 
% increased by eta (eta = 2 or eta = 10 and epsilon = 0.2 are often used) 
% until (24) is not satisfied, and then the penultimate  is selected. If,
% on the other hand, the original alpha does not satisfy (24), it is 
% repeatedly divided by eta until the resulting alpha does satisfy (24).
% LUREMBERG,et. al p.232
%--------------------------------------------------------------------------
%INPUT:
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
% epsilon = valor constante que auxilia no crescimento ou decrescimento de
%           alpha
%
% eta = valor que aumenta ou diminui o alpha
%
% alpha0 = chute inicial de alpha
%
%
% sim = variavel da fun�ao
%
% OUTPUT:
%
% alpha: = valor aproximado de alpha otimo 




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

%% 
% calcula o valor da funcao unidimensional
f_unidim = double(subs(f_alpha,alpha,alpha0));

% calcula o valor da funcao linear
f_linear = double(subs(f_alpha,alpha,0)) + epsilon*double(subs(f_1_alpha,alpha,0))*alpha0;

%iterador
k=0;

%% Teste das condi�oes de Armijo ***VIDE TEXTO NA FUNCAO*****

%a condi�ao � atendida
if(f_unidim <= f_linear)
    )
    while(f_unidim <= f_linear)
     %atualiza alpha0   
     alpha0 = alpha0*eta 
     %atualiza a fun��o unidimensional
     f_unidim = double(subs(f_alpha,alpha,alpha0));
     %atualiza a fun��o linear
     f_linear = double(subs(f_alpha,alpha,0)) + epsilon*double(subs(f_1_alpha,alpha,0))*alpha0;
     %atualiza k
     k=k+1;
    end
    %imprime numero de iteracoes e exibe valor final
    fprintf('Iteracoes: %d\n',k)
    % y recebe o valor anterior ao ultimo calculoado, por isso divide-se
    % por eta
    y = alpha0/eta;
    
%a condicao nao � atendida    
else 
    while(f_linear <= f_unidim)
    %atualiza alpha0    
    alpha0 = alpha0/eta
    %atualiza a func�o unidimensional
    f_unidim = double(subs(f_alpha,alpha,alpha0));
    %atualiza a funcao linear
    f_linear = double(subs(f_alpha,alpha,0)) + epsilon*double(subs(f_1_alpha,alpha,0))*alpha0;
    %atualiza k
    k=k+1;
    end
    %imprime e exibe o valor aproximado de alpha0
    fprintf('Iteracoes: %d \n',k)
    y = alpha0
end

toc
function n = fibonacci(m)
if m<=0
    display('A série Fibonacci é definida para numeros positivos');
else
    if m<3
        n=1;
    else
        n=fibonacci(m-1)+fibonacci(m-2);
    end
end
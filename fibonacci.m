function n=fibonacci(m)
if m<=0
    display('A s�rie Fibonacci � definida para numeros positivos');
else
    if m<3
        n=1;
    else
       % tic
        n=fibonacci(m-1)+fibonacci(m-2);

    end
end
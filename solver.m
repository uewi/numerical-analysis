function x=solver()
n = 100;
A = -1*diag(ones(1, n-1),1)+2*diag(ones(1, n),0)-1*diag(ones(1, n-1),-1);
L = chol(A);
L2 = transpose(L);
b = transpose((1:1:n));
y = transpose(ones(1, n));
x = transpose(ones(1, n));

y(1) = b(1)/L2(1,1);
j = 1;
i = 2;
while i < n+1
    s = 0;
    while j < i
        s = s + L2(i,j)*y(j);
        j = j + 1;
    end
    y(i)=(b(i)- s)/L2(i,i);
    i = i + 1;
end

x(n) = y(n)/L(n,n);
i = n - 1;
while i > 0
    s = 0;
    j = i + 1;
    while j < n + 1
        s = s + L(i,j)*x(j);
        j = j + 1;
    end
    x(i)=(y(i)- s)/L(i,i);
    i = i - 1;
end
end




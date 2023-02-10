function x = solver2()
n = 100;
A = -1*diag(ones(1, n-1),1) + 2*diag(ones(1, n), 0)-1*diag(ones(1, n-1),-1);
b = transpose((1:1:n));
L = chol(A);
x = linsolve(L, linsolve(transpose(L), b));
end

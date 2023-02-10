function [x, f, dG, i] = newton(t)
x = t;
G = ones(2, 1);
H = ones(2, 2);
f = 3 * x(1)^2 * x(2) + 2 * x(2)^2 - (9/4) * x(1)^2;
G(1) = 6 * x(1) * x(2) - (9/2) * x(1);
G(2) = 3 * x(1)^2 + 4 * x(2);
dG = norm(G, inf);
H(1,1) = 6 * x(2) - (9/2); H(1,2) = 6 * x(1);
H(2,1) = 6 * x(1); H(2,2) = 4;
i = 0;
while (dG > eps) && (i <= 100)
    i = i + 1;
    [R, flag] = chol(H);
    t = norm(diag(H) , inf );
    while (flag ~= 0)
        t = 2 * t;
        H = H + t * eye(2,2);
        [R, flag] = chol(H);
    end
    x = x + linsolve(R, linsolve(transpose(R), -G));
    f = 3 * x(1)^2 * x(2) + 2 * x(2)^2 - (9/4) * x(1)^2; 
    G(1) = 6 * x(1) * x(2) - (9/2) * x(1);
    G(2) = 3 * x(1)^2 + 4 * x(2);
    dG = norm(G , inf);
    H(1,1) = 6 * x(2) - (9/2); H(1,2) = 6 * x(1);
    H(2,1) = 6 * x(1); H(2,2) = 4;
    fprintf('i = %d ', i);
    fprintf('dG = %d', dG);
    fprintf('\n')
end
end

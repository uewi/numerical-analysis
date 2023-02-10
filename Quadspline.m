function a = Quadspline(x,y)
i = 1;
n = size(y, 1);
A = zeros(3*(n - 1),3*(n - 1));

while i < n
    
    A(3*(i - 1) + 1, 3 *(i - 1) + 1) = 1;
    
    A(3*(i - 1) + 2, 3*(i - 1) + 1) = 1;
    
    A(3*(i - 1) + 2, 3*(i - 1) + 2) = x(i + 1) - x(i);
    
    if(i > n - 2)
        
        A(3*(n - 1), 3*floor(n/2)) = 1;
        
    else
        A(3*(i - 1) + 3, 3*(i - 1) + 2:3*(i - 1) + 6) = [1 x(i + 1) - x(i) 0 -1 x(i + 2) - x(i + 1)];
        
        A(3*(n - 1), 3*floor(n/2) + 3) = -1;    
    end
    i = i + 1;
end

b = zeros(3*(n - 1), 1);

b(1:3:3*(n - 1) - 2) = y(1:n-1);

b(2:3:3*(n - 1) - 1) = y(2:n);

a = linsolve(A, b);
end

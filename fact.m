function [y, ncalc] = fact(n)
if n < 0 || floor(n) ~= n
    y = -1;
    ncalc = 0;
    disp('error')
    return
end    
    y=1;
    ncalc = 0;
    for i =2:n
        y = y*i;
        ncalc = ncalc + 1;
    end
end





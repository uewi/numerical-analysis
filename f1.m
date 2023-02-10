function c = f1(a,b)
if a < b
    c = abs(b)/(sqrt(1 + (a/b)^2)+ abs(a/b));
end

if a > b
    c = abs(a)*(b/a)^2/(sqrt((b/a)^2 + 1)+ 1);
end
end
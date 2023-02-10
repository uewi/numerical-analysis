function n = n()
n = 1;
while ((n * 2^(n - 1))< 1/eps(1))
 n = n + 1;
end
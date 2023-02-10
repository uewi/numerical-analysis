function [I, fcount] = Q1(TOL)
clc
global fcount;
a = 0;
b = 1;
n = 1;
fcount = 0;
S2n = simpson(2*n, a, b);
Sn = simpson(n, a, b);
while ( abs( S2n - Sn )/15 > TOL )
 n = 2 * n;
 fcount = 0;
 Sn = simpson(n, a, b);
 S2n = simpson(2*n, a, b);
 
 
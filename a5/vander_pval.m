function p = vander_pval(c, x)
% 
% input  c:  a (n+1)-vector, the coefficients of IP
%        x:  a number
% output y:  a (n+1)-vector = p(x) = c0*x^0 + ... + cn*x^n

n = length(x)-1;

p = c(n+1);
for i = n-1:-1:0
    p = c(i+1) + x.*p;
end
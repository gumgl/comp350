function [y, evals] = erf_asm(t, tol)
% Error function (statistics) computed by Adaptive Simpson's Method

f = @(x) exp(-x^2);

m = 2/sqrt(pi);

a = 0;
b = t;
c = (a+b)/2;

R = asm(f,a,b,tol/m,1,30,f(a),f(b),f(c));
y = m * R(1);
evals = R(2) + 3;

end


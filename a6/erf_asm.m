function y = erf_asm(t, tol)
% Error function (statistics) computed by the Adaptive Simpson's Method

f = @(x) exp(-x^2);

m = 2/sqrt(pi);

global evals;
a = 0;
b = t;
c = (a+b)/2;
evals = 3;

y = m * asm(f,a,b,tol/m,1,30,f(a),f(b),f(c));
evals

end


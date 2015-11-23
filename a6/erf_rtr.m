function y = erf_rtr(t, tol)
% Error function (statistics) computed by the Recursive Trapezoidal Rule

f = @(x) exp(-x^2);

c = 2/sqrt(pi);

y = c * rtr(f, 0, t, tol/c);

end


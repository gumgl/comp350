function y = erf_rtr(t, tol)
% Error function (statistics) computed by the Recursive Trapezoidal Rule

f = @(x) exp(-x^2);

m = 2/sqrt(pi);

y = m * rtr(f, 0, t, tol/m);

end


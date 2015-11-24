function [y, evals] = erf_cgtpq( t, n )
% Error function computed by a composite Gaussian two-point quadrature rule
%   input:
%           n: number of intervals
%   output:
%           y: erf(t)

f = @(x) exp(-x^2);

[y, evals] = cgtpq(f, 0, t, n);
y = 2/sqrt(pi) * y;

end


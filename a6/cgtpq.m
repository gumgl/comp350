function [numI, evals] = cgtpq(f, a, b, n)
% Function integration using a composite Gaussian two-point quadrature rule
%   input:
%           f: function we are integrating. Note: not its name.
%           a, b: x-range where we are evaluating f's value
%           epsilon: tolerance between two consecutive computed integrals
%           level: used during the recursion to keep track of depth
%           level_max: maximum recursion level
%           fa, fb, fc: f(a), f(b), f(c) used to save function evaluations
%   output:
%           area: area under the curve f from a to b

evals = 0;
h = (b-a)/n;
I = 0;

for i=0:n-1
    I = I + f(h*i + h/2 - h/(2*sqrt(3)) + a);
    I = I + f(h*i + h/2 + h/(2*sqrt(3)) + a);
    evals = evals + 2;
end

numI = h/2 * I;

end


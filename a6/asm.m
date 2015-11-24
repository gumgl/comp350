function R = asm(f,a,b,epsilon,level,level_max,fa,fb,fc)
% Function integration using Adaptive Simpson's Method
%   input:
%           f: function we are integrating. Note: not its name.
%           a, b: x-range where we are evaluating f's value
%           epsilon: tolerance between two consecutive computed integrals
%           level: used during the recursion to keep track of depth
%           level_max: maximum recursion level
%           fa, fb, fc: f(a), f(b), f(c) used to save function evaluations
%   output:
%           area: area under the curve f from a to b

h = b-a;
I1 = h*(fa+4*fc+fb)/6;
level = level+1;
c = (a+b)/2;
d = (a+c)/2;
e = (c+b)/2;
fd = feval(f,d);
fe = feval(f,e);
evals = 2;
I2 = h*(fa+4*fd+2*fc+4*fe+fb)/12;
if level >= level_max
    numI = I2;
elseif abs(I2-I1) <= 15*epsilon
    numI = I2;
else
    R = asm(f,a,c,epsilon/2,level,level_max,fa,fc,fd) + asm(f,c,b,epsilon/2,level,level_max,fc,fb,fe);
    %[numI, evals] = tmp{:} % hack because Matlab doesn't let us assign element-wise the result of an addition...
    numI = R(1);
    evals = evals + R(2);
end

R = [numI, evals];
end


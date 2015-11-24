function [area, evals, n] = rtr( f, a, b, tol)
% Function integration using the Recursive Trapezoid Rule
%   input:
%           f: function we are integrating. Note: not its name.
%           a, b: x-range where we are evaluating f's value
%           tol: tolerance between two consecutive computed integrals
%   output:
%           area: area under the curve f from a to b

n = 0;
evals = 0;
%disp(tol);

% calculate for n=0, i.e. only one big interval [a,b]
h = (b-a);
I(n+1) = 1/2*h*(f(a)+f(b));
evals = evals + 2;
%fprintf('I(%d)=%.30f\n', n, I(n+1));

while n<1 || abs(I(n+1)-I(n-1+1)) > tol % calculate for n=1.. until tol is reached
    n = n+1;
    
    h = (b-a)/2^n;
    sub_sum = 0;
    for i=1:2^(n-1)
        sub_sum = sub_sum + f(a + (2*i-1)*h);
        evals = evals + 1;
    end
    
    I(n+1) = 1/2 * I(n-1+1) + h * sub_sum;
    %fprintf('I(%d)=%.30f\n', n, I(n+1));
end

%fprintf('%d function evaluations, n=%d\n', evals, n);

area = I(n+1);

end


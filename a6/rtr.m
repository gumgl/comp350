function area = rtr( f, a, b, tol)
%RTR Summary of this function goes here
%   input:
%           f: function we are integrating. Note: not its name.
%           a, b: x-range where we are evaluating f's value
%           tol: tolerance between two consecutive computer integrals. once
%                attained we return.
%   output:
%           area: area under the curve f from a to b

n = 0;

% calculate for n=0, i.e. only one big interval [a,b]
h = (b-a);
I(0) = 1/2*h*(f(a)+f(b));

while n<1 || abs(I(n)-I(n-1)) <= tol % calculate for n=1.. until tol is reached
    n = n+1;
    
    h = (b-a)/2^n;
    sub_sum = 0;
    for i=1:2^(n-1)-1
        sub_sum = sub_sum + f(a + i*h);
    end
    
    I(n) = 1/2 * I(n-1) + h * sub_sum;
end

area = I(n);

end


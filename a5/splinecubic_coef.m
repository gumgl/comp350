function [ z ] = splinecubic_coef(t, y)
%%SPLINECUBIC_COEF Computes the coefficients of the cubic splines
%
%   input: t is a (n+1)-vector containing the x-values f(t_i) = y_i
%          y is a (n+1)-vector containing the y-values at t
%   output: z are the coefficients of each Si(x)
n = length(t)-1;
h = ones(n+1);
b = ones(n+1);
u = ones(n+1);
v = ones(n+1);

for i = 1+0 : 1+n-1
    h(i) = t(i+1) - t(i);
    b(i) = (y(i+1) - y(i))./h(i);
end
%% Forward elimination
u(1+1) = 2.*(h(1+0) + h(1+1));
v(1+1) = 6.*(b(1+1) - b(1+0));
for i = 1+2 : 1+n-1
    u(i) = 2.*(h(i-1) + h(i)) - (h(i-1).^2)./u(i-1);
    v(i) = 6.*(b(i) - b(i-1)) - h(i-1).*v(i-1)./u(i-1);
end
%% Back substitution
z(1+n) = 1;
for i = 1+n-1 : -1 : 1+1
    z(i) = (v(i) - h(i).*z(i+1))./u(i);
end
z(1+0) = 0;

end


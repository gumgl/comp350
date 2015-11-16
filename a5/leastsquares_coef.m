function c = leastsquares_coef(x, y)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%y = y';
n = length(x)-1;
A = zeros(n+1,3);
c = zeros(3,1);

A(1:n+1, 1) = 1;
A(1:n+1, 2) = x.^2;
A(1:n+1, 3) = x.^4;
c = A\(y.');
c = c';
end


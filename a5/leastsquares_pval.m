function y = leastsquares_pval( c, xx )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
n = length(xx)-1;
y = ones(n+1,1);
for i = 1:n+1
	y(i) = c(1) +  c(2)*xx(i)^2 + c(3)*xx(i)^4;
end

end


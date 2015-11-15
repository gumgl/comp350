
function c = vander_coef( x, y )
%vander_coef.m Compute the Vandermonde form of an interpolating polynomial
%
% input
%   x:  column (n+1)-vector with distinct components
%   y:  column (n+1)-vector
%
% output
%   a: column vector containing the coefficients of the Vandermonde IP
%
n = length(x)-1;
A = ones(n+1,n+1);

%for i = 0:n % row
%    for j = 1:n % col
%        A(i+1,j+1) = x(i+1)^j;
%    end
%end

for j = 1:n
    A(:, j + 1) = A(:, j) .* x;
end

c = gepp(A,y);

end


% Guillaume Labranche 260585371 COMP-350 Fall 2015
function xt = q3a_genp(d,a,b)
% q3a_genp.m    Gauss elimination with no pivoting
% 
% input:  d, a, b are 2n+1 x 1 vectors
% output: x is the solution of Ax=b.
%
n = (length(b)-1)/2;
fprintf('n=%d\n',n);
for i = 1:n
    mult = a(i)/d(i);
    % j: equivalent index on the other side of matrix
    j = 2*n+2-i;
    d(j) = d(j) - mult*a(j);
    b(j) = b(j) - mult*b(i);
    a(i)=0;
end

x = zeros(1,2*n+1);
x(n+1:2*n+1) = b(n+1:2*n+1)./d(n+1:2*n+1);
x(1:n) = (b(1:n)-a(2*n+1:-1:n+2).*x(2*n+1:-1:n+2)) ./d(1:n);

xt = x.';
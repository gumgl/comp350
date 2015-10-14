% Guillaume Labranche 260585371 COMP-350 Fall 2015
function xt = q3a_gepp(d,a,b)
% q3a_genp.m    Gauss elimination with partial pivoting
% 
% input:  d, a, b are 2n+1 x 1 vectors
% output: x is the solution of Ax=b.
%
n = (length(b)-1)/2;
%fprintf('GEPP n=%d\n',n);
for i = 1:n
    % j: equivalent index on the other side of matrix
    j = 2*n+2-i;
    if a(i) > d(i)
        % swap a(i) d(i)
        tmp = a(i);
        a(i) = d(i);
        d(i) = tmp;
        % swap a(j) d(j)
        tmp = a(j);
        a(j) = d(j);
        d(j) = tmp;
        % swap b(i) b(j)
        tmp = b(i);
        b(i) = b(j);
        b(j) = tmp;
    end
    mult = a(i)/d(i);
    d(j) = d(j) - mult*a(j);
    b(j) = b(j) - mult*b(i);
    a(i)=0;
end

x = zeros(1,2*n+1);
x(n+1:2*n+1) = b(n+1:2*n+1)./d(n+1:2*n+1);
x(1:n) = (b(1:n)-a(2*n+1:-1:n+2).*x(2*n+1:-1:n+2)) ./d(1:n);

xt = x.';
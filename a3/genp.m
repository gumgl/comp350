function x = genp(A,b)
% genp.m    Gauss elimination with no pivoting
% 
% input:  A is an n x n nonsingular matrix
%         b is an n x 1 vector
% output: x is the solution of Ax=b.
%
n = length(b);
disp('Starting [A b]:');
disp([A b.']);
for k = 1:n-1  
   for i = k+1:n  
     mult = A(i,k)/A(k,k);  
     A(i,k:n) = A(i,k:n)-mult*A(k,k:n); 
     b(i) = b(i) - mult*b(k);
     fprintf('k=%d, i=%d, mult=%f\n',k,i,mult);
     disp([A b.']);
   end
end
x = zeros(n,1);
x(n) = b(n)/A(n,n);
for k = n-1:-1:1  
  x(k) = (b(k) - A(k,k+1:n)*x(k+1:n))/A(k,k);
end

function root = newton(fname,fdname,x,xtol,ftol,n_max,display)
% Newton's Method.
%
% input:  fname is a string that names the function f(x).
%         fdname is a string that names the derivative f'(x).
%         x is the initial point
%         xtol and ftol are termination tolerances
%         n_max is the maximum number of iteration
%         display = 1 if step-by-step display is desired,
%                 = 0 otherwise
% output: root is the computed root of f(x)=0
%
n = 0;
fx = feval(fname,x);
if display == 1,
   disp(' --Newton''s Method--');
   disp('   n             x                    f(x)');
   fprintf('%4d %23.15e %23.15e\n', n, x, fx);
elseif display == 2,
   disp(' --Newton''s Method (LaTeX table)--');
   disp('$n$ & $x$ & $f(x)$\\');
   fprintf('$%4d$ & $%23.15e$ & $%23.15e$\\\\\n', n, x, fx);
end
if abs(fx) <= ftol
   root = x;
   return
end
for n = 1:n_max
    fdx = feval(fdname,x);
    d = fx/fdx;
    x = x - d;
    fx = feval(fname,x);
    if display == 1, 
       fprintf('%4d %23.15e %23.15e\n', n, x, fx);
    elseif display == 2,
       fprintf('$%4d$ & $%23.15e$ & $%23.15e$\\\\\n', n, x, fx);
    end
    if abs(d) <= xtol | abs(fx) <= ftol
       root = x;
       return
    end
end
root = x;

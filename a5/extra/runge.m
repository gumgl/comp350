% Script File: runge
% For n = 8:2:20, the equal-spacing interpolating polynomial of 
% f(x) = 1/(1+25x^2) on [-1,1]' are of plotted.

x = linspace(-1,1,100)'; 
y = 1 ./ (1 + 25*x.^2);
for n = 8:2:20
   plot(x,y,'k-');
   title('Runge Functin')
   hold on
   disp('Press any key to continue');
   pause     
   x_equal = linspace(-1,1,n+1)'; 
   y_equal = 1 ./ (1 + 25*x_equal.^2);
   plot(x_equal,y_equal,'*');
   title(sprintf('Equal Spacing (n = %2.0f)',n))
   hold on
   disp('Press any key to continue');
   pause
   a = newton_coef(x_equal, y_equal);
   pval = newton_pval(a, x_equal, x);
   plot(x,pval,'r--')
   title(sprintf('Polynomial Interpolation (n = %2.0f)',n))
   disp('Press any key to continue');
   pause
   hold off
end

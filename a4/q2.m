%% Calculate the root
x0 = 1;
x1 = 2;
xtol = 1.e-12;
ftol = 1.e-12;
delta = 1.e-12;
n_max = 100000;
display = 1;

rootb = bisection('f', x0, x1, delta, display);
rootn = newton('f', 'fd', x1, xtol, ftol, n_max, display);
rooth = halley('f', 'fd', 'fdd', x1, xtol, ftol, n_max, display);
roots = secant('f', x0, x1, xtol, ftol, n_max, display);

%% Display graph
min = 0;
max = 3;
num_points = 1000;

x = min:abs(max-min)/num_points:max;
xmarkers = [x0 x1 roots]; % place markers at these x-values
ymarkers = f(xmarkers);
figure;
plot(x,f(x),'g',x,fd(x),'r',x,fdd(x),'c',[min,max],[0,0],xmarkers,ymarkers,'g*');
%plot(x,fd(x));
title('Approximation of Roots with Different Methods')
xlabel('x')
ylabel('y')
text(xmarkers(1),ymarkers(1), '  x_0');
text(xmarkers(2),ymarkers(2), '  x_1');
text(xmarkers(3),ymarkers(3), sprintf('  root=%f',roots));

%% Print graph to a PDF for insertion into LaTeX
ti = get(gca,'TightInset');
set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
set(gca,'units','centimeters');
pos = get(gca,'Position');
ti = get(gca,'TightInset');
set(gcf, 'PaperUnits','centimeters');
set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);

print -dpdf q2plotv
f = @(x) 1./(1+25*x.^2);
numnodes = 7;
x_min = -1;
x_max = 1;
x_diff = abs(x_max-x_min);
x_margin = 0.1; % Margin relative to x range
x_nodes = x_min:x_diff/(numnodes-1):x_max;

y_nodes = f(x_nodes);
y_min = min(y_nodes);
y_max = max(y_nodes);
y_diff = abs(y_max-y_min);
y_margin = 0.2;
xx = x_min-x_diff*x_margin:(x_diff+2*x_margin)/200:x_max+x_diff*x_margin;

%% a) Newton f(x)
a = newton_coef(x_nodes,y_nodes);
p = @(pval) newton_pval(a,x_nodes,pval);

%% b) Cubic spline S(x)
%sx,si = sort(x); % Sort x
%sy = y(si); % Sort y with the x order
z = splinecubic_coef(x_nodes, y_nodes);
S = @(pval) splinecubic_pval(z, x_nodes, y_nodes, pval);

%% c) Least squares g(x)
c = leastsquares_coef(x_nodes, y_nodes);
g = @(pval) leastsquares_pval(c, pval);

%% 13 equally spaced values
x_midway = x_min:x_diff/(numnodes-1)/2:x_max; % split the intervals in 2
num_midway = length(x_midway);
M = zeros(num_midway, 4);
for i = 1:num_midway
    x= x_midway(i);
    fprintf('$%10g$ & $%10g$ & $%10g$ & $%10g$ & $%10g$ \\\\\n', x, f(x), f(x)-p(x), f(x)-S(x), f(x)-g(x));
end

%% Graph
hold on % Keep all plots on graph
plot(x_nodes,y_nodes,'bo');
plot(xx, f(xx));
plot(xx,p(xx));
plot(xx,S(xx));
plot(xx,g(xx));
legend('knots','f(x)','p(x)','S(x)', 'g(x)');
axis([x_min-x_diff*x_margin x_max+x_diff*x_margin y_min-y_diff*y_margin y_max+y_diff*y_margin])
title('Polynomial and Spline Interpolation, Least Squares Approximation')
xlabel('x')
ylabel('y')
grid
hold off

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

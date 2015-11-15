%% Setup
x = 1:4
y = [2,0,-10,-34]
xx = min(x) : (max(x)-min(x))/200 : max(x); % for plotting

%% Vandermonde form
c = vander_coef(x.',y.')
result_v = polyval(fliplr(c.'),xx);

%% Lagrange form
[P,R,S] = lagrange_coef(x,y)
result_l = polyval(P,xx);

%% Newton form
a = newton_coef(x,y)
result_n = newton_pval(a,x,xx);

%% Evaluation

hold on % Keep all plots on graph
plot(x,y,'bo');
pause
plot(xx,result_v);
pause
plot(xx,result_l);
pause
plot(xx,result_n);
grid
hold off
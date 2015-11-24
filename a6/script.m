%% Setup
format long % display full precision numbers
t = 3;
ans_matlab = erf(t);
fprintf('Matlab built-in erf(%d)=%.30f\n', t, erf(t));

%% 1(a) Recursive Trapezoid Rule
[ans_1a, evals_1a, n_1a] = erf_rtr(t, 1e-5);
error_1a = abs(ans_1a - ans_matlab);
fprintf('Answer 1.a) erf_rtr(%d)=%.30f in %d evals with 2^%d intervals\n', t, ans_1a, evals_1a, n_1a);
fprintf('Error: %.30f\n', error_1a);

%% 1(b) Adaptive Simpson's Method
[ans_1b, evals_1b] = erf_asm(t, 1e-5);
error_1b = abs(ans_1b - ans_matlab);
fprintf('Answer 1.b) erf_asm(%d)=%.30f in %d evals\n', t, ans_1b, evals_1b);
fprintf('Error: %.30f\n', error_1b);

%% 2(b) Composite Gaussian two-point quadrature rule
m = 2^n_1a;
n = floor((m+1)/2);

[ans_2b, evals_2b] = erf_cgtpq(t, n);
error_2b = abs(ans_2b - ans_matlab);

fprintf('Answer 2.b) erf_cgtpq(%d)=%.30f in %d evals with %d intervals\n', t, ans_2b, evals_2b, n);
fprintf('Error: %.30f\n', error_2b);

disp(error_1a / error_2b);
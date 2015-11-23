%% (a) Recursive Trapezoid Rule
ans_a = erf_rtr(3, 1e-5);
fprintf('Answer a) %.30f\n', ans_a);

%% (b) Adaptive Simpson's Method

ans_b = erf_asm(3, 1e-5);
fprintf('Answer b) %.30f\n', ans_b);
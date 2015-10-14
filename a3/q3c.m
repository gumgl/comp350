n = 4;
tests = 10000;
results = zeros(tests, 3);
for i=1:tests
    d = randn(1,2*n+1);
    d(1) = 10^-13;
    a = randn(1,2*n+1);
    a(n+1) = d(n+1);
    b = d + a(2*n+1:-1:1);
    b(n+1) = d(n+1);
    
    x = ones(2*n+1,1);
    xnp = q3a_genp(d,a,b);
    xpp = q3a_gepp(d,a,b);
    
    enp = norm(x-xnp)/norm(x);
    epp = norm(x-xpp)/norm(x);
    
    results(i,1:3) = [enp epp enp/epp];
end

imp = results(:,3);

avg_imp = mean(imp(~isinf(imp)),'omitnan')
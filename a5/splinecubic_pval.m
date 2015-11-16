function S = splinecubic_pval(z, t, y, xx)
%UNTITLED2 summary of this function goes here
%   Detailed explanation goes here

% Linear search through the range
n = length(t)-1;
qn = length(xx);
S = ones(qn,1);
for q = 1 : qn
    for i = 1+0 : 1+n-1
        if xx(q) - t(i+1) <= 0
            break;
        end
    end
    h = t(i+1) - t(i);
    B = -h * z(i+1)/6 - h * z(i)/3 + (y(i+1) - y(i))/h;
    D = (z(i+1) - z(i))/(6*h);
    S(q) =  y(i) + (xx(q) - t(i)) * (B + (xx(q) - t(i)) * (z(i)/2 + (xx(q) - t(i))*D));
end
end

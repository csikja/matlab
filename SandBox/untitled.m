clc
close all
x = linspace(-4,4,1000);
f = @(x) x.*(1-x.^2).*exp(-x.^2);
plot(x, f(x))

[fmax, idx_max] = max(f(x));
[fmin, idx_min] = min(f(x));
hold on

plot(x(idx_max), fmax, 'or', x(idx_min), fmin, 'or')

y = f(x);
y = y(y > 0.1);
min(abs(diff(y)))
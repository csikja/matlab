function [t, x] = euler_solve(ivp)

f = ivp.model;
x0 = ivp.initial_value;
t0 = ivp.interval(1);
tf = ivp.interval(2);

if isempty(ivp.step_size)
    h = abs(tf-t0)/1000;
else
    h = ivp.step_size;
end

t = t0:h:tf;
n = length(t);

x = zeros(length(x0), n);
x(:,1) = x0;

for i = 2:n
    x(:,i) = x(:,i-1) + h*f(t(i-1),x(:,i-1));
end

end
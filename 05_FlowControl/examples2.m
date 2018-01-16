% examples

%% Square root of a positive number
clc;
a = 10;
x = a/2;
n = 1;
err = abs(x^2-a)/a;

while err > a*eps || n <= 100
    x = (x + a/x)/2;
    err = abs(x^2-a)/a;
    n = n + 1;
end
disp(['sqrt(', num2str(a), ') = ', num2str(x)])

%% Searching for root
% See the function version
%

a = 0.2;
b = 1;

interval = [a, b];
f = @(x) exp(-x)-x;
%f = @(x) x^2*sin(5*x);
%f = @(x) x+1;
if sign(f(a)) == sign(f(b))
    error('The sign of the function should be different at the endpoints.')
end

while (b-a) > eps*b
   c = (a+b)/2;
   if f(c) == 0
      break
   elseif sign(f(c)) == sign(f(a))
      a = c;
   else
      b = c;
   end
end

fplot(f, interval)
line('XData', interval, 'YData', [0, 0])
a = text(...
    'String', num2str(c),...
    'Position', [c, 0],...
    'Color', [1, 0, 0],...
    'VerticalAlignment', 'bottom',...
    'Margin', [10]);
hold on
plot(c, 0, 'ro')


%% Exponential growth

clc;
n = 20;
growthRate = 1.2;
x = zeros(1,n);
x(1) = 1;
for i = 1:(n-1)
    x(i+1) = growthRate*x(i);
end

stem(1:n, x)



%% Fibonacchi numbers
clc
n = 30;
fib = zeros(1,n);
fib(1) = 1;
fib(2) = 1;

for k = 3:n 
fib(k) =  fib(k-1) + fib(k-2);
end

disp(fib')


%% Linear digital filters

clc
n = 50;
x = zeros(1, n);
x(1:2) = 0;

u = ones(1, n);
u(1:9) = 0;

for i = 3:n
   x(i) =  0.9*x(i-1) - 0.75*x(i-2) + 0.85*u(i);
end

stem(1:n, [x', u'])


%% Chaos Game
clear all
n = 500;
t = (0:(2*pi/3):(4*pi/3))+pi/2;
dir = [cos(t);sin(t)];

X = zeros(2,n);

for i = 1:(n-1)
    X(:,i+1) = (dir(:,randi([1,3])) + X(:,i))/2;
end

scatter(X(1,:), X(2,:), 'r.')
axis('square')
axis('equal')













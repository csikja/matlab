n = 400;
x = zeros(1,n);
y = zeros(1,n);
for M = 1:n
    x(M) = max(collatz(M));
    y(M) = length(collatz(M))-1;
end
figure('Color', [1, 1, 1])
plot(1:n,x,'.', 'Color', [0, 0.5, 1])

figure('Color', [1, 1, 1])
hist(y,max(y))
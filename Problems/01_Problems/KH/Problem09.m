
%% a
clc
sumN = @(n) sum(1:n);
sumN(50)

%% b
clc
sumN2 = @(n) sum((1:n).^2);
sumN2(20)

%% c
clc
fact = @(n) prod(1:n);
fact(5)

% d
binom = @(n,k) fact(n)/(fact(n-k)*fact(k));
binom(7,3)

%% e
clc
ln2 = @(n) sum( ((-1).^((1:n)+1)) ./(1:n) )
ln = ln2(4)

%% f
clc
solQuad = @(a,b) [(-a-(a^2-4*b)^0.5)/2 , (-a+(a^2-4*b)^0.5)/2];
solQuad(3,-4)

%% g
clc
n=10;
x1 = (floor(21.*rand(n,1)))'
CumAvr = @(x) cumsum(x)./(1:length(x));
c = CumAvr(x1)
plot (1:n,x1, 'xr');
hold on;
plot (1:n,c);
% That was a really tough one!!!

%% h
clc
n=10;
x1 = (floor(21.*rand(n,1)))'
first = @(x) x(1,1);
first(x1);

%% i
clc
n=10;
x1 = (floor(21.*rand(n,1)))'
rest = @(x) x(2:end);
rest(x1)

%% j
clc
n=10;
x1 = (floor(21.*rand(n,1)))'
take = @(x,m) x(1:min([length(x),m]));
take(x1,5)
take(x1,12) % m = longer than original vector, but doesn't create an error

%% k
clc
n=10;
x1 = (floor(21.*rand(n,1)))'
drop = @(x,m) x(min([length(x),m])+1:end);
drop(x1,5)
drop(x1,12) % m = longer than original vector, but doesn't create an error

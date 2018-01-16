clc;
x1=-10;
x2=30;
X = floor(x1 + (x2+1-x1).*rand(20,1))
a = X(X<0);
b = X(X>=7);
c = X(X>5 & X<=12);
d = X(mod(X,2)==0);
e = X(mod(X,3)==0 | mod(X,7)==0);
f = X(mod(360,X)==0);
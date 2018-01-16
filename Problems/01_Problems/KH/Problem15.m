clc;
clear all;
x1 = linspace (-10,10);
x2 = linspace (0,10);

subplot(3,1,1);
plot (x1,sin(x1)./x1);
subplot(3,1,2);
plot (x1, sin(1./x1));
subplot (3,1,3);
plot (x2,x2.^2.*exp(-x2).*cos(5.*x2));


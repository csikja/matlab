clear all;
clc;
steps=1000;
dir = [1 0; 0 1; -1 0; 0 -1];

figure()

randomWalk = @(n) cumsum(dir(floor(rand(1,n)*4)+1,:));

a = randomWalk(steps);
plot(a(:,1),a(:,2));
axis('equal');

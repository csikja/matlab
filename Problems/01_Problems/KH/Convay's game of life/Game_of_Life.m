% Conway's Game of life
clc
n = 10;
r = 0.4; % ratio of live cells in random grid

field = floor(rand(n,n)+r);
% 

% field = [0,1,1,0;1,1,0,1;0,1,1,1;1,0,1,1]
% grid example from Problem_01_Matlab.pdf

new_field = next_generation(field);


% graphics:
screen = get(0, 'ScreenSize');
screen(1:2) = [];

figure('Position', [screen(1)/4,screen(2)/3, screen/4])
image(field*-16+24);
axis ('equal');
axis ('off');
title('Original grid');

figure('Position', [screen(1)/2,screen(2)/3, screen/4])
image(new_field*-16+24);
axis ('equal');
axis ('off');
title('New grid');

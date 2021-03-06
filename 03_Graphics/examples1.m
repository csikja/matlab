%% Examples


%% Example 1: Scatter plot + confidence bounds
close all
x = 0.1*randn(1,1000);
y = 0.2 + 0.5*randn(1, 1000);
scatter(x, y, '.b')
grid on
xlim([-2,2])
ylim([-2,2])
title('Scatter plot')

X = mean(x);
Y = mean(y);
r1 = std(x);
r2 = std(y);

draw_ellipse = @(k) rectangle(...
        'Position', [X-k*r1, Y-k*r2, 2*k*r1, 2*k*r2],...
        'Curvature', [1, 1],...
        'EdgeColor', [1, 0, 0],...
        'FaceColor', 'none',...
        'LineWidth', 2,...
        'LineStyle', '--');

arrayfun(draw_ellipse, 0.1:0.5:4)

%% Example 4: Random walk (1D)
clc
clear
close all

steps = 10000;    % number of steps
n = 5;          % number of particles
dir=[-1, 1];    % directions
walks=cumsum(dir(randi(1:2, steps, n)));    % realization

plot(walks)

%% Example 3: Regular polygons 
close all
% 
n = 5;  % number of vertices
fi = pi/10; % rotation
th = linspace(0, 2*pi, n+1) + fi;
x = cos(th);
y = sin(th);

screen = get(0, 'ScreenSize');
screen(1:2) = [];
fig_size = [400, 400];
fig_pos = [screen/2-fig_size/2, fig_size];
figure(...
    'Position', fig_pos,...
    'MenuBar', 'no',...
    'Color', [1 1 1],...
    'Name', ['Regular ', num2str(n), '-gon'],...
    'NumberTitle', 'off')
axes(...
    'Visible', 'off',...
    'DataAspectRatio', [1, 1, 1])
patch(...
    'XData', x,...
    'YData', y,...
    'FaceColor', [0.2, 0.6, 1],...
    'EdgeColor', 'none')

%% Example 4: Star
close all
n = 15;

fi = pi/2-2*pi/5;
th = linspace(0, 2*pi, n+1) + fi;

x = cos(th);    % outer points
y = sin(th);

r = 0.45;
x_in = r*cos(th+pi/n);    % inner points
y_in = r*sin(th+pi/n);

star_x = reshape([x;x_in], 1, 2*(n+1));
star_y = reshape([y;y_in], 1, 2*(n+1));


screen = get(0, 'ScreenSize');
screen(1:2) = [];
fig_size = [400, 400];
fig_pos = [screen/2-fig_size/2, fig_size];

figure(...
    'Position', fig_pos,...
    'MenuBar', 'no',...
    'Color', [1 1 1],...
    'Name', 'Star',...
    'NumberTitle', 'off')
axes(...
    'Visible', 'off',...
    'DataAspectRatio', [1, 1, 1])
patch(...
    'XData', star_x,...
    'YData', star_y,...
    'FaceColor', [0.2, 0.6, 1],...
    'EdgeColor', 'none')


%% Example 5: Random triangles

n = 100;
points = 10*rand(6, n);

draw_triangle = @(k) patch(...
                        'XData', points(1:3,k),...
                        'YData', points(4:6,k),...
                        'FaceColor', [0, 0, 0],...
                        'FaceAlpha', 0.1,...
                        'EdgeColor', 'none');



screen = get(0, 'ScreenSize');
screen(1:2) = [];
fig_size = [400, 400];
fig_pos = [screen/2-fig_size/2, fig_size];

figure('MenuBar', 'no',...
       'Color', [1, 1, 1],...
       'Name', 'Random Triangles',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', fig_pos)
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])

arrayfun(draw_triangle, 1:n)


%% Example 6: Random regular triangles
clc
n = 50;

x = 8*rand(1, n);           % centre of triangles
y = 8*rand(1, n);           %
fi = 2*pi*rand(1,n)/3;      % rotations around the centre
r = 0.5 + 1.5*rand(1,n);    % radii (distance of the center and a vertex)
           
get_vectors = @(fi,r) [...
    cos(fi);
    cos(2*pi/3+fi);
    cos(4*pi/3+fi);
    sin(fi);
    sin(2*pi/3+fi);
    sin(4*pi/3+fi)].*repmat(r,6,1);

points = [repmat(x, 3, 1);
          repmat(y, 3, 1)] + get_vectors(fi, r);


draw_triangle = @(k) patch(...
                        'XData', points(1:3,k),...
                        'YData', points(4:6,k),...
                        'FaceColor', [0, 0, 0],...
                        'FaceAlpha', 0.3,...
                        'EdgeColor', 'none');
                    
screen = get(0, 'ScreenSize');
screen(1:2) = [];
fig_size = [400, 400];
fig_pos = [screen/2-fig_size/2, fig_size];

figure('MenuBar', 'none',...
       'Color', [1, 1, 1],...
       'Name', 'Random Triangles',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', fig_pos)
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])

arrayfun(draw_triangle, 1:n)

%% Example 7: Color disks

n = 10;
fi = 0;
th = linspace(0, 2*pi, n+1) + fi;
x = cos(th);
y = sin(th);
 
circ = @(x, y, r) [x-r, y-r, 2*r, 2*r];
plot_disk = @(x, y, c) rectangle(...
                            'Position', circ(x, y, 3.5),...
                            'Curvature', [1, 1],...
                            'FaceColor', [1, 0.2*(1-c)+0.8*c, 0],...,
                            'EdgeColor', 'none');

screen = get(0, 'ScreenSize');
screen(1:2) = [];
fig_size = [400, 400];
fig_pos = [screen/2-fig_size/2, fig_size];

figure('Position', fig_pos,...
       'MenuBar', 'no',...
       'Color', 0.2*[1, 1, 1],...
       'Name', 'Colours',...
       'NumberTitle', 'off',...
       'NextPlot', 'add')
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])
 
arrayfun(plot_disk, 5*x, 5*y, linspace(0, 1, n+1))

%% Example 8: Rotating lines

d=1;

draw_line = @(x, th) line('XData', [x-cos(th), x+cos(th)],...
                      'YData', [1-d*sin(th), 1+d*sin(th)],...
                      'LineWidth', 2,...
                      'Color', 'white');

screen = get(0, 'ScreenSize');
screen(1:2) = [];
fig_size = [400, 400];
fig_pos = [screen/2-fig_size/2, fig_size];

figure('MenuBar', 'no',...
       'Color', 0.3*[1, 1, 1],...
       'Name', 'Rotating lines',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', fig_pos)
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])
 
arrayfun(draw_line, linspace(0,3,20), linspace(0,pi,20))

%% Example 9: Dice
clc

circ = @(x, y, r) [x-r, y-r, 2*r, 2*r];
dice = logical(...
       [1 0 1;
        0 1 1;
        0 0 1]);

row_index = (1:3)'*ones(1,3);       % see also meshgrid
col_index = flipdim(row_index',2);


drawDice = @(i, j)...
    rectangle(...
        'Position', circ(i,j,0.4),...
        'FaceColor', [1, 1, 1],...
        'EdgeColor', 'none',...
        'Curvature', [1, 1]);
    
screen = get(0, 'ScreenSize');
screen(1:2) = [];
fig_size = [400, 400];
fig_pos = [screen/2-fig_size/2, fig_size];

figure('Position', fig_pos,...
       'MenuBar', 'no',...
       'Color', 0.2*[1, 1, 1],...
       'Name', 'Dice',...
       'NumberTitle', 'off',...
       'NextPlot', 'add')
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])

rectangle(...
        'Position', [0, 0, 4, 4],...
        'Curvature', 0.1*[1, 1],...
        'EdgeColor', [1, 1, 1],...
        'FaceColor', 'none',...
        'LineWidth', 10)
    
arrayfun(drawDice, row_index(dice), col_index(dice))

%% Example 10: Buffon's needle

screen = get(0, 'ScreenSize');
screen(1:2) = [];
fig_pos1 = [screen/4, screen./[4, 2]];
fig_pos2 = [screen/4+[screen(1)/4+10, 0], screen./[4, 2]];

clc
n = 50000;
x = 6*rand(1,n);    
y = 6*rand(1,n);    
th = pi*rand(1,n);   

N = min([300, n]);                      
s = sin(th) >= 2*(1-abs(mod(y,2)-1));
rel_freq = cumsum(s)./(1:n);


figure('MenuBar', 'no',...                      
       'Color', [1, 1, 1],...                   
       'Name', 'Needles',...     
       'NumberTitle', 'off',...                 
       'NextPlot', 'add',...
       'Position', fig_pos1)
   
axes('Visible', 'off',...                       
     'DataAspectRatio', [1 1 1],...             
     'XGrid', 'on',...                          
     'YGrid', 'on',...
     'GridLineStyle', ':')

draw_hline = @(y)...
    line('XData', [-1, 7], 'YData', [y, y], 'Color', 0.6*[1, 1, 1]);
arrayfun(draw_hline, 0:2:6)

draw_needle = @(x, y, th, c) ...
    line(...
    'XData', x + 0.5*[-cos(th), cos(th)],...
    'YData', y + 0.5*[-sin(th), sin(th)],...
    'LineWidth', 2,...
    'Color', [c, 0, 0]);
arrayfun(draw_needle, x(1:N), y(1:N), th(1:N), s(1:N));

figure('MenuBar', 'no',...
       'Color', [1, 1, 1],...
       'Name', 'Relative frequency',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', fig_pos2)

plot(rel_freq)
xlabel('Number of experiments')
ylabel('Relative frequency')

line('XData', [0, n], 'YData', [1, 1]/pi, 'Color', [1, 0.5, 0])
set(gca,...
     'XGrid', 'on',...
     'YGrid', 'on',...
     'GridLineStyle', ':',...
     'YLim', [0,0.5]);
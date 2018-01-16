%% Introduction to Matlab Programming
%
% Rudolf Csikja (csikja@math.bme.hu)
% 
% Mathematics Institute
% Budapest University of Technology and Economics
% 
% Graphics
%
%


%% High level graphics functions
%

%% Line Plots

x = [1, 2, 3, -1, 0];
y = [0, 3, 2, -4, 5];
plot(x, y)

%%
x = rand(1, 50);
y = rand(1, 50);
plot(x, y)

%%
x = linspace(-2*pi, 2*pi);
plot(x, sin(x), x, cos(x))

%%
x = linspace(0,2*pi);
plot(sin(2*x), cos(3*x))

%% Holding onto an already existing plot
x = linspace(-2*pi, 2*pi);
plot(x, sin(x));
hold on           % without this line the first plot is erased 
plot(x, cos(x), 'r')
hold off          % releasing the 'hold'

%% Minimal styling
x = 5*linspace(-1,1);
f = @(n, x) x.*(1-x.^(2*n)).*exp(-x.^2);
plot(x, f(1, x), 'k-o', x, f(2, x), 'r-x')
title('Title: nice functions: \alpha, \beta, \mu, 2^A, f_\Delta')
xlabel('abscissa')
ylabel('ordinate')
legend('x(1-x^2)exp(-x^2)', 'x(1-x^4)exp(-x^2)')
xlim([-5.5, 5.5])
ylim([-1, 1])
grid on

%grid minor
%cla                % clear graphics from axes
%cla reset          % reset axes



%% Axis
t = linspace(0,2*pi);
plot(sin(t), cos(t))
%axis('equal')
axis('square')
%axis([-2, 2, -3, 3])
%axis('tight')


%% Easy to use plot
ezplot('x^3*exp(-x)', [0,10])

%% Implicit function
figure()
ezplot('x^2 + y^2 = 1', [-2, 2, -2, 2])
colormap([0 0 1])
figure()
ezplot('2*x^2 - y^2 = 1', [-2, 2, -2, 2])
axis('square')

%% Multiple axes in one figure
x = linspace(-2*pi,2*pi);
subplot(3, 2, 3)
plot(x, sin(x), x, cos(x))
title('sine and cosine')
grid on

subplot(3, 2,  [1 2])
plot(x, x.*(1-x.^2).*exp(-x.^2), 'r')
title('wave')
grid on

subplot(3, 2, [4 6])
plot(x, x.^2, 'k')
title('square')
grid on

subplot(3, 2, 5)
plot(x, exp(-x.^2), 'b', x, 0.8*exp(-0.1*x.^2), 'r')
title('gauss')
grid on

%% logarithmic scales
clc
x = linspace(0, 100,500);
y = x.^3.*exp(-x);
subplot(2, 2, 1)
plot(x, y)
title('normal plot')
grid on

subplot(2, 2, 2)
semilogx(x, y)
title('logaritmic - x')
grid on

subplot(2, 2, 3)
semilogy(x, y)
title('logaritmic - y')
grid on

subplot(2, 2, 4)
loglog(x, y)
title('logaritmic - x,y')
grid on

%% error bar
x = linspace(0, 10, 20);
y = x.^3.*exp(-x);
lowerErr = 0.1+0.5*rand(1,20);
upperErr = 0.1+0.5*rand(1,20);

subplot(2, 1, 1)
errorbar(x, y, lowerErr, '.-b')
title('Symmetric confidence bounds')

subplot(2, 1, 2)
errorbar(x, y, lowerErr, upperErr, 'sk')
title('Unsymmetric confidence bounds')

%% multiple scale plots
x = linspace(0, 20);
y1 = x.^3.*exp(-x);
y2 = x.^8.*exp(-x);

subplot(2, 1, 1)
plotyy(x, y1, x, y2)
title('Multiple scale plot')
grid on

subplot(2, 1, 2)
plotyy(x, y1, x, y2, @plot, @semilogy)
title('Use log scale for the y axis of the second graph')
grid on

% but how to change style?
% see the answer later

%% polar plot
th = linspace(0,2*pi);
r = 3*sin(3*th)+1;
polar(th, r)

%% Area plots

%% Bar plot

x = 1:20;
y = randi([-3, 10], 1, 20);
subplot(2, 1, 1)
bar(x,y)
subplot(2, 1, 2)
barh(x,y)



%% Histogram
x = linspace(-3,3);
y = 0.5*randn(1,1000);
subplot(2, 1, 1)
hist(y, 50)
title('histogram using 50 bins')
subplot(2, 1, 2)
hist(y, x)
title('histogram using explicitely specified bins')

%% Pie chart
x = randi([1, 10], 1, 5);
explode = [0 0 0 1 0];
pie(x,explode)

%% Discrete data plot

%% stem
n = 1:20;
stem(n, n.^3.*2.^(-n), '.k')
ylim([0,5])
title('Discrete data plot')
grid on

%% scatter plot
x = 0.1*randn(1,1000);
y = 0.2 + 0.5*randn(1, 1000);
scatter(x, y, '.r')
grid on
xlim([-2,2])
ylim([-2,2])
title('Scatter plot')



%% Graphics object

%% root
% Graphics -> Graphics Objects -> Core Objects -> Properties -> Root
% Properties

% get all properties
get(0)

%% get a specific property
format loose
format long
get(0, 'Format')
get(0, 'FormatSpacing')

%% set properties
set(0, 'Format', 'short', 'FormatSpacing', 'compact')

%% Monitor position
% See documentation of Root Properties
get(0, 'MonitorPosition')

%% Screen size
% very useful for figure positioning
clc
screen = get(0, 'ScreenSize')
screen(1:2) = []

%% Creating a new figure object
% automatic numbering
% default position
figure
figure

%% Close all figures
close all

%% Manual numbering
figure(12)
figure(5)
figure(10)

%% Closing particular figures
close 10
close 5 12

%% Using object handle to change position, size
fig = figure(7);
set(7, 'Position', [0, 0, 700, 400])
set(fig, 'Position', [500, 300, 700, 400])

%%
% using screen resolution
screen = get(0, 'ScreenSize')
screen(1:2) = []
figure('Position', [screen-[700, 400], 700, 400])

%% Center figure

figure('Position', [screen/8, 6*screen/8])
figure('Position', [screen/4, 2*screen/4])
figure('Position', [screen/3, screen/3])
figure('Position', [2*screen/5, screen/5])

%% Variation on centering
dX = [screen(1)/4, 0];

figure('Position', [screen/4, screen/4])
figure('Position', [screen/4 + dX, screen/4])

%% Variation on centering
dX = [screen(1)/4 + 10, 0];
dY = [0, screen(2)/4 + 90];

figure('Position', [screen/4, screen/4])
figure('Position', [screen/4 + dX, screen/4])
figure('Position', [screen/4 + dY, screen/4])
figure('Position', [screen/4 + dY + dX, screen/4])

%% Some other properties
figPos = [screen/4, screen/2];
figure(...
    'Position', figPos,...
    'MenuBar', 'no',...
    'Color', [0.1 0.3 0.7],...
    'Name', 'My favorite window',...
    'NumberTitle', 'off',...
    'Resize', 'off')

%% Creating new axes
figPos = [screen/4, screen/2];
figure(...
    'Position', figPos,...
    'MenuBar', 'no',...
    'Color', 0.85*[1 1 1],...
    'Name', 'Axes properties',...
    'NumberTitle', 'off')

axes(...
    'Position', [0.1, 0.1, 0.35, 0.8])

axes(...
    'Position', [0.55, 0.1, 0.35, 0.8],...
    'XLim', [-10,5],...
    'YLim', [-2, 4],...
    'Box', 'on',...
    'Color', [0.3 0.6 0.9],...
    'FontName', 'Times',...
    'FontSize', 16,...
    'FontWeight', 'bold',...
    'LineWidth', 2.5,...
    'XColor', [0.8, 0.2, 0.1],...
    'YColor', [0, 0, 0.8],...
    'GridLineStyle', '--',...
    'XGrid', 'on')

%% Plot Objects

%% lineseries/plot
clc

x = linspace(-1,1,20);

figPos = [screen/4, screen/2];
figure(1)
set(1,...
    'Position', figPos,...
    'MenuBar', 'no',...
    'Color', 0.85*[1 1 1],...
    'Name', 'Axes properties',...
    'NumberTitle', 'off')
axes(...
    'Position', [0.1, 0.1, 0.35, 0.8])
line_handle1 = lineseries();
get(line_handle1)

axes(...
    'Position', [0.55, 0.1, 0.35, 0.8],...
    'NextPlot', 'add')
line_handle2 = lineseries();

set(line_handle2,...
    'XData', x,...
    'YData', x.^2,...
    'Color', [0, 0, 0],...
    'LineWidth', 2,...
    'LineStyle', '--')

% Plot creats lineseries
plot(x, x.^3,...
    'Color', [0, 0.3, 1],...
    'LineWidth', 2,...
    'Marker', 's',...
    'MarkerSize', 10,...
    'MarkerFaceColor', 'yellow',...
    'MarkerEdgeColor', 'red')


% errorbarseries
% stemseries
% etc. they are all similar

%% XDataSource, YDataSource
x = linspace(-1,1,20);
y = x.*(1-x.^2);
set(line_handle1, 'XDataSource', 'x', 'YDataSource', 'y')

refreshdata

%%
y = x.*x;
refreshdata


%% Changing default color order
x = linspace(0,2*pi);

set(0, 'DefaultAxesColorOrder', [0.3, 0.4, 1; 0, 0.2, 0.3; 0.9, 0.2, 0.4])
figure()
axes()
plot(x, sin(x), x, sin(2*x), x, sin(3*x))

                 
%% Graphics primitives
close all
figPos = [7*screen(1)/10, screen(2)/4, 3*screen(1)/10, screen(2)/2];
figure(1)
set(1,...
    'Position', figPos,...
    'MenuBar', 'no',...
    'Color', [1 1 1],...
    'Name', 'Graphics Primitives',...
    'NumberTitle', 'off')
axes(...
    'Box', 'on',...
    'DataAspectRatio', [1, 1, 1],...
    'XLim', [0,10],...
    'YLim', [0, 10])

%% Rectangle
rectangle('Position', [1, 2, 6, 3],...
          'EdgeColor', 'none',...
          'FaceColor', [0, 0.7, 0.2]);

%% Rectangle with round corners
rectangle('Position', [6, 1, 3, 6],...
          'Curvature', [2*0.1, 0.1],...
          'FaceColor', 'none',...
          'EdgeColor', 'k',...
          'LineWidth', 5);

%% Ellipse
rectangle('Position', [7, 8, 2, 1],...
          'Curvature', [1, 1],...
          'FaceColor', 'black');

%% Circle/disk (rectangle)
rectangle('Position', [3, 8, 1, 1],...
          'Curvature', [1, 1],...
          'EdgeColor', 'red',...
          'FaceColor', 'yellow',...
          'LineWidth', 3);

      
%% Text
text('String', 'MATLAB',...
     'Position', [3, 3],...
     'Color', [1, 1, 1],...
     'FontWeight', 'bold',...
     'FontSize', 18, ...
     'FontName', 'Times',...
     'FontAngle', 'Italic',...
     'HorizontalAlignment', 'center');

%% math expression
text('String', '\LaTeX: $\Gamma(z) = \displaystyle\int\limits_0^{+\infty} t^{z-1}e^{-t}\,dt$',...
     'Position', [0.2, 1],...
     'FontSize', 16, ...
     'Color', [0, 0, 0.7],...
     'FontName', 'Times',...
     'HorizontalAlignment', 'left',...
     'Interpreter', 'latex');

 
%% line
line('XData', [0, 10],...
     'YData', [10, 0],...
     'LineStyle', '--',...
     'Color', [0.1, 0.1, 0.1],...
     'LineWidth', 2)


%% polygon
 patch('XData', [1, 5, 9, 2],...
      'YData', [3, 7, 3, 2],...
      'EdgeColor', 'red',...
      'FaceColor', [0.9, 0.9, 0],...
      'LineWidth', 3)
  

%% Example 1: Scatter plot + confidence bounds

x = 0.1*randn(1,1000);
y = 0.2 + 0.5*randn(1, 1000);
scatter(x, y, '.k')
grid on
xlim([-2,2])
ylim([-2,2])
title('Scatter plot')

X = mean(x);
Y = mean(y);
r1 = std(x);
r2 = std(y);

arrayfun(@(k) rectangle(...
        'Position', [X-k*r1, Y-k*r2, 2*k*r1, 2*k*r2],...
        'Curvature', [1, 1],...
        'EdgeColor', [1, 0, 0],...
        'FaceColor', 'none',...
        'LineWidth', 2,...
        'LineStyle', '-'),...
            [0.1, 1, 2, 3 4 5 6])

%% Example 2a: Random walk in 1D

% This is not a nice solution
n = 1000;
dir = [-1, 1];
traj1 = randi(1:2, 1, n);
traj2 = randi(1:2, 1, n);
traj3 = randi(1:2, 1, n);

%%
plot(1:n, cumsum(dir(traj1)), 1:n, cumsum(dir(traj2)), 1:n, cumsum(dir(traj3)))

%% Example 2b: Random walk in 2D

% Use anonymus functions
n = 1000;
dir = [-1, 1];
s = 1:n;

randomWalk = @() cumsum(dir(randi(1:2,1,n)));

plot(s, randomWalk(), s, randomWalk(), s, randomWalk())

%% Example 2c: Random walk in 2D
% Use funarray
n = 1000;
dir = [-1, 1];
s = 1:n;

figure()
axes('NextPlot', 'add')
colors = get(gca, 'ColorOrder');

randomWalk = @() cumsum(dir(randi(1:2,1,n)));
% plotRandomWalk = @(k) plot(s, randomWalk());
% arrayfun(plotRandomWalk, 1:10)

plotRandomWalk = @(k) plot(s, randomWalk(), 'Color', colors(mod(k, numel(colors)/3)+1,:));

N = 50;
arrayfun(plotRandomWalk, 0:(N-1))

%% Example 3: Regular polygons 

% 

n = 5;
fi = pi/2-2*pi/5;
th = linspace(0, 2*pi, n+1) + fi;
x = cos(th);
y = sin(th);

screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, screen/2];
figure(...
    'Position', figPos,...
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
n = 5;


fi = pi/2-2*pi/5;
th = linspace(0, 2*pi, n+1) + fi;

x = cos(th);
y = sin(th);

r = 0.5;
xx = r*cos(th+pi/n);
yy = r*sin(th+pi/n);

starX = reshape([x;xx], 1, 2*(n+1));
starY = reshape([y;yy], 1, 2*(n+1));

screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, screen/2];
figure(...
    'Position', figPos,...
    'MenuBar', 'no',...
    'Color', [1 1 1],...
    'Name', 'Star',...
    'NumberTitle', 'off')
axes(...
    'Visible', 'off',...
    'DataAspectRatio', [1, 1, 1])
patch(...
    'XData', starX,...
    'YData', starY,...
    'FaceColor', [0.2, 0.6, 1],...
    'EdgeColor', 'none')


%% Example 5: Random triangles

n = 50;
points = 10*rand(6, n);

drawTriangle = @(k) patch(...
                        'XData', points(1:3,k),...
                        'YData', points(4:6,k),...
                        'FaceColor', [0, 0, 0],...
                        'FaceAlpha', 0.1,...
                        'EdgeColor', 'none') 


screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, screen/2];

figure('MenuBar', 'no',...
       'Color', [1, 1, 1],...
       'Name', 'Random Triangles',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', figPos)
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])

arrayfun(drawTriangle, 1:n)


%% Example 6: Random regular triangles
clc
n = 50;

x = 8*rand(1, n);
y = 8*rand(1, n);
fi = 2*pi*rand(1,n)/3;
r = 0.5 + 1.5*rand(1,n);

getVectors = @(a,r) [cos(a);
                      cos(2*pi/3+a);
                      cos(4*pi/3+a);
                      sin(a);
                      sin(2*pi/3+a);
                      sin(4*pi/3+a)].*repmat(r,6,1);
           
points = [repmat(x, 3, 1);
          repmat(y, 3, 1)] + getVectors(fi, r);


drawTriangle = @(k) patch(...
                        'XData', points(1:3,k),...
                        'YData', points(4:6,k),...
                        'FaceColor', [0, 0, 0],...
                        'FaceAlpha', 0.3,...
                        'EdgeColor', 'none') 
screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, screen/2];

figure('MenuBar', 'none',...
       'Color', [1, 1, 1],...
       'Name', 'Random Triangles',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', figPos)
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])

arrayfun(drawTriangle, 1:n)

%% Example 7: Color disks
n = 50;

fi = 0;
th = linspace(0, 2*pi, n+1) + fi;

x = cos(th);
y = sin(th);

circ = @(x, y, r) [x-r, y-r, 2*r, 2*r];

screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, screen/2];

figure('MenuBar', 'no',...
       'Color', 0.2*[1, 1, 1],...
       'Name', 'Colours',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', figPos)
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])

plotCirc = @(x, y, c) rectangle(...
                            'Position', circ(x, y, 3.5),...
                            'Curvature', [1, 1],...
                            'FaceColor', [1, 0.2*(1-c)+0.8*c, 0],...,
                            'EdgeColor', 'none');

arrayfun(plotCirc, 5*x, 5*y, linspace(0, 1, n+1))

%% Example 8: Rotating lines

screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, screen/2];

figure('MenuBar', 'no',...
       'Color', 0.3*[1, 1, 1],...
       'Name', 'Rotating lines',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', figPos)
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])

d=1;
arrayfun(@(x, th) line('XData', [x-d*cos(th), x+d*cos(th)],...
                      'YData', [1-d*sin(th), 1+d*sin(th)],...
                      'LineWidth', 2,...
                      'Color', 'white'),...
                      linspace(0,3,20), linspace(0,pi,20))

%% Example 9: Dice
clc
screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, screen/2];

circ = @(x, y, r) [x-r, y-r, 2*r, 2*r];
dice = logical(...
       [1 0 1;
        0 0 0;
        1 0 1]);

rowIndex = (1:3)'*ones(1,3);
colIndex = rowIndex';

drawDice = @(i, j)...
    rectangle(...
        'Position', circ(j,4-i,0.4),...
        'FaceColor', [1, 1, 1],...
        'EdgeColor', 'none',...
        'Curvature', [1, 1]);

screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, screen/2];

figure('MenuBar', 'no',...
       'Color', 0.2*[1, 1, 1],...
       'Name', 'Dice',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', figPos)
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])

rectangle(...
        'Position', [0, 0, 4, 4],...
        'Curvature', 0.1*[1, 1],...
        'EdgeColor', [1, 1, 1],...
        'FaceColor', 'none',...
        'LineWidth', 10)
    
arrayfun(drawDice, rowIndex(dice), colIndex(dice))

%% Example 10: Buffon's needle

screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos1 = [screen/4, screen./[4, 2]];
figPos2 = [screen/4+[screen(1)/4+10, 0], screen./[4, 2]];

clc
n = 10000;
x = 6*rand(1,n);    
y = 6*rand(1,n);    
th = pi*rand(1,n);   

N = min([300, n]);                      
s = sin(th) >= 2*(1-abs(mod(y,2)-1));  
relFreq = cumsum(s)./(1:n);


figure('MenuBar', 'no',...                      
       'Color', [1, 1, 1],...                   
       'Name', 'Needles',...     
       'NumberTitle', 'off',...                 
       'NextPlot', 'add',...                    
       'Position', figPos1)        
   
axes('Visible', 'off',...                       
     'DataAspectRatio', [1 1 1],...             
     'XGrid', 'on',...                          
     'YGrid', 'on',...
     'GridLineStyle', ':')

drawHLine = @(y)...
    line('XData', [-1, 7], 'YData', [y, y], 'Color', 0.8*[1, 1, 1]);
arrayfun(drawHLine, 0:2:6)

drawNeedle = @(x, y, th, c) ...
    line(...
    'XData', x + 0.5*[-cos(th), cos(th)],...
    'YData', y + 0.5*[-sin(th), sin(th)],...
    'LineWidth', 2,...
    'Color', [c, 0, 0]);
arrayfun(drawNeedle, x(1:N), y(1:N), th(1:N), s(1:N));



figure('MenuBar', 'no',...
       'Color', [1, 1, 1],...
       'Name', 'Relative frequency',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', figPos2)

plot(relFreq)
xlabel('Number of experiments')
ylabel('Relative frequency')

line('XData', [0, n], 'YData', [1, 1]/pi, 'Color', [1, 0.5, 0])
set(gca,...
     'XGrid', 'on',...
     'YGrid', 'on',...
     'GridLineStyle', ':',...
     'YLim', [0,0.5]);
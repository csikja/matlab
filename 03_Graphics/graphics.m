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

%% function plot
x = linspace(-2*pi, 2*pi);
plot(x, sin(x), x, cos(x))

%% parametric plot
x = linspace(0,2*pi);
plot(sin(2*x), cos(3*x))

%% Keeping an already existing plot
x = linspace(-2*pi, 2*pi);
plot(x, sin(x));
hold on                     % without this line the first plot is erased 
plot(x, cos(x), 'r')
hold off                    % releasing the 'hold'

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
%axis('square')
%axis([-2, 2, -3, 3])
%axis('tight')


%% Easy to use plot
ezplot('x^3*exp(-x)', [0,10])

%% Implicit function
figure(1)
ezplot('x^2 + y^2 = 1', [-2, 2, -2, 2])
colormap([0, 0, 1])
figure(2)
ezplot('2*x^2 - y^2 = 1', [-2, 2, -2, 2])
axis('square')
colormap([1, 0, 0])

%% Multiple axes in one figure
x = linspace(-2*pi,2*pi,200);
subplot(3, 2, 3)
plot(x, sin(x), '.', x, cos(x), '.')
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
title('logarithmic - x')
grid on

subplot(2, 2, 3)
semilogy(x, y)
title('logarithmic - y')
grid on

subplot(2, 2, 4)
loglog(x, y)
title('logarithmic - x,y')
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

% how to change style?
% see the answer below

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
pie(x, explode)

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

%%
figure()
plot(x,y,'.r')

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
set(0,...
    'Format', 'short',...
    'FormatSpacing', 'compact')

%% Monitor position
% See documentation of Root Properties
get(0, 'MonitorPosition')

%% Screen size
% very useful for figure positioning
clc
screen = get(0, 'ScreenSize')
%screen(1:2) = []
screen = screen(3:4)

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

%%
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
%%
% Plot creates lineseries
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

%%
refreshdata

%%
y = x.*x;
refreshdata


%% Changing default color order
x = linspace(0,pi,200);

set(0, 'DefaultAxesColorOrder', [0.3, 0.4, 1;
                                 0, 0.2, 0.3;
                                 0.9, 0.2, 0.4])
figure()
axes()
plot(x, sin([x; 2*x; 3*x; 4*x]))
                 
%% Graphics primitives
close all
screen = get(0, 'ScreenSize')
screen(1:2) = []
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

% Rectangle
rectangle('Position', [1, 2, 6, 3],...
          'EdgeColor', 'none',...
          'FaceColor', [0, 0.7, 0.2]);

% Rectangle with round corners
rectangle('Position', [6, 1, 3, 6],...
          'Curvature', [2*0.1, 0.1],...
          'FaceColor', 'none',...
          'EdgeColor', 'k',...
          'LineWidth', 5);

% Ellipse
rectangle('Position', [7, 8, 2, 1],...
          'Curvature', [1, 1],...
          'FaceColor', 'black');

% Circle/disk (rectangle)
rectangle('Position', [3, 8, 1, 1],...
          'Curvature', [1, 1],...
          'EdgeColor', 'red',...
          'FaceColor', 'yellow',...
          'LineWidth', 3);

      
% Text
text('String', 'MATLAB',...
     'Position', [3, 3],...
     'Color', [1, 1, 1],...
     'FontWeight', 'bold',...
     'FontSize', 18, ...
     'FontName', 'Times',...
     'FontAngle', 'Italic',...
     'HorizontalAlignment', 'center');

% math expression
text('String', '\LaTeX: $\Gamma(z) = \displaystyle\int\limits_0^{+\infty} t^{z-1}e^{-t}\,dt$',...
     'Position', [0.2, 1],...
     'FontSize', 16, ...
     'Color', [0, 0, 0.7],...
     'FontName', 'Times',...
     'HorizontalAlignment', 'left',...
     'Interpreter', 'latex');

 
% line
line('XData', [0, 10],...
     'YData', [10, 0],...
     'LineStyle', '--',...
     'Color', [0.1, 0.1, 0.1],...
     'LineWidth', 2)


% polygon
 patch('XData', [1, 5, 9, 2],...
      'YData', [3, 7, 3, 2],...
      'EdgeColor', 'red',...
      'FaceColor', [0.9, 0.9, 0],...
      'LineWidth', 3,...
      'FaceAlpha', 0.4,...
      'EdgeAlpha', 0.5)

%% The hierarchy of objects:
% change the default style of plotyy
close all

x = linspace(0, 20);
y1 = x.^3.*exp(-x);
y2 = x.^8.*exp(-x);

subplot(2, 1, 1)
pA = plotyy(x, y1, x, y2);
title('Multiple scale plot')
grid on

subplot(2, 1, 2)
pB = plotyy(x, y1, x, y2, @plot, @semilogy);
title('Use log scale for the y axis of the second graph')
grid on

get(0, 'Children')


% the 4 axes of the figure  
a = get(gcf, 'Children')
set(a(4), 'Color', [0.9, 1, 0])
%%
% lines

set(pA(1), 'YColor', [1, 0, 0])
set(get(pA(1), 'Children'), 'Color', [1, 0, 0], 'LineWidth', 2)
set(pA(2), 'YColor', [0, 0, 1])
set(get(pA(2), 'Children'), 'Color', [0, 0, 1], 'LineWidth', 2)


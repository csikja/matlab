n = 1000;

x = 2*rand(1, n)-1;
y = 2*rand(1, n)-1;


relFreq = 4*cumsum(x.^2 + y.^2 <= 1)./(1:n)

screenSize = get(0, 'ScreenSize');
screenSize = screenSize(3:4);

myRed = [1, 0.273, 0];

figure(...
    'MenuBar', 'none',...
    'Name', 'Monte Carlo Simulation - Area of the unit circle',...
    'NumberTitle', 'off',...
    'Position', [screenSize./[8, 4], screenSize./[8/3, 2]],...
    'Color', [1, 1, 1])
axes(...
    'DataAspectRatio', [1 1 1],...
    'XLim', [-1.05, 1.05],...
    'YLim', [-1.05, 1.05],...
    'FontSize', 14,...
    'FontName', 'Times')
title('Illustration of the experiments')

rectangle(...
    'Position', [-1,-1,2,2],...
    'Curvature', [1, 1],...
    'LineWidth', 3,...
    'Edgecolor', [0, 0, 0],...
    'Facecolor', 0.8*[1, 1, 1])

% helyette scatter-t lehet használni
drawPoint = @(x,y) rectangle(...
    'Position', [x-0.01, y-0.01, 0.02, 0.02],...
    'Curvature', [1, 1],...
    'Facecolor', myRed,...
    'Edgecolor', myRed);

arrayfun(drawPoint, x, y)

figure(...
    'MenuBar', 'none',...
    'Name', 'Monte Carlo Simulation - Relative frequency',...
    'NumberTitle', 'off',...
    'Position', [screenSize./[2, 4], screenSize./[8/3, 2]],...
    'Color', [1, 1, 1],...
    'Colormap', [1, 1, 1; 0, 0, 0])
axes(...
    'XLim', [0, n],...
    'YLim', [0, 4],...
    'FontSize', 14,...
    'FontName', 'Times')

line('XData', [1, n], 'YData', pi*[1, 1], 'LineStyle', '--')
line('XData', 1:n, 'YData', relFreq, 'Color', myRed)
grid on
xlabel('Number of experiments')
ylabel('Approximation of the unit circle''s area')





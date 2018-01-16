clc
V = 1:5;
n = length(V);



% all edges
[colIndex, rowIndex] = meshgrid(1:n,1:n);
E = [colIndex(:), rowIndex(:)]'

% deleting loops
E(:,E(1,:) == E(2,:)) = [];

% choosing edges randomly
% total number of directed edges: n(n-1)
E = E(:,randsample(1:(n*(n-1)), randi([n, n*(n-1)-n])))

% E = [1 1 3 3 4; 2 3 1 2 2];


E1 = E(1,:);
E2 = E(2,:);

isEdge = @(i,j) any(E1 == i) && any(E2(E1 == i) == j);
A = arrayfun(isEdge, rowIndex, colIndex)

rowSum = sum(A, 2);
M = A./repmat(rowSum, 1, n);
M(rowSum==0,:) = 1/n;

S = ones(n)/n;
a = 0.85;
P = a*M + (1-a)*S;

x = null(P'-eye(n));
r = x/sum(x)
[~, R] = sort(r, 'descend')


%% visualization of directed edges?
%
% more on graph visualization:
% https://github.com/graphviz4matlab/graphviz4matlab
%

fi = pi*18/180;
th = fi + 2*pi*(0:(n-1))/n;
vX = cos(th);
vY = sin(th);

figure('MenuBar', 'figure',...
       'Color', [1, 1, 1],...
       'Name', 'The graph',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', [300, 50, 500, 500])
   
gplot(A, [vX', vY']);

set(gca, 'Visible', 'off',...
     'DataAspectRatio', [1 1 1])

 arrayfun(@(x,y) rectangle('Position', [x-0.2,y-0.2, 0.4, 0.4],...
                          'Curvature', [1, 1],...
                          'FaceColor', 'Blue'),...
         vX, vY)
arrayfun(@(xk, yk, vk, rank)...
    text('String', ['$', num2str(rank), ':v_', num2str(vk),'$'],...
    'Position', [xk, yk],...
    'Color', [1, 1, 1],...
    'FontSize', 12,...
    'HorizontalAlignment','center',...
    'Interpreter', 'latex'),...
         vX, vY, 1:n, R')
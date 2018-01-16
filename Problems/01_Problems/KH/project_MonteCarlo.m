%% Monte Carlo Simulation
clc
n = 1000;
x = rand(1,n)*2-1;
y = rand(1,n)*2-1;
N = (x.^2+y.^2)<=1;
% a = [ 1 2 3 4 5 6];
% b = mod(a,2)==0; % retrieves logical matrix
N_prob = cumsum(N)./[1:n];

% left plot
subplot(1, 2, 1);
hold on

  % circle
rectangle ('Position', [-1,-1,2,2],...
           'Curvature', [1,1],...
           'EdgeColor', 'k',...
           'LineWidth', 2,...
           'FaceColor', [0.8 0.8 0.8])

  % dots
scatter(x,y,'.r');
axis('equal',...
    [-1.1, 1.1, -1.1, 1.1]);

% right plot
subplot(1, 2, 2);
hold on;

  % pi horizontal line
line([1 n],[pi,pi],...
    'Color', [1,0.3,0.3],...
    'LineStyle', ':');

  % cumulative probability
plot(N_prob.*4); 
axis('square');
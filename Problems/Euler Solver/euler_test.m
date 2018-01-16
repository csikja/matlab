
%% Logistic growth
clear t x ivp

ivp.model = @(t, x) x*(1-x);
ivp.interval = [0, 5];
ivp.step_size = 0.01;

% initial values
ivs = 0:0.25:2;

% computing the solution for every initial value
for i = 1:length(ivs)
    ivp.initial_value = ivs(i);
    [t, x(i,:)] = euler_solve(ivp);
end

% figure creation
screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, 0.5*screen/2];

figure('MenuBar', 'figure',...
       'Color', [1, 1, 1],...
       'Name', 'Logistic Growth',...
       'NumberTitle', 'off',...
       'Position', figPos)
% plotting the solutions
plot(t,x, 'LineWidth', 1, 'Color', [0, 0.5, 1])

set(gca,...
    'FontName', 'Times',...
    'FontSize', 12,...
    'YLim', [-0.2, 2.2],...
    'FontAngle', 'italic')

title('Logistic Growth')
xlabel('t')
ylabel('x(t)')
grid on

%% Damped oscillator
clear t x ivp
% initial value
ivp.interval = [0, 20];
ivp.initial_value = [1;0];
ivp.step_size = 0.01;


% figure creation
screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, 0.5*screen/2];

figure('MenuBar', 'figure',...
       'Color', [1, 1, 1],...
       'Name', 'Damped Oscillator',...
       'NumberTitle', 'off',...
       'Position', figPos)
set(gca,...
    'NextPlot', 'Add',...
    'Box', 'on',...
    'FontAngle', 'italic',...
    'FontName', 'Times',...
    'FontSize', 12)
   
% damping parameter
p = 0.2:0.1:1.4;
% calculate and plot the solution for every parameter
n = length(p);
u = zeros(1,n);
for i = 1:n;
    ivp.model = @(t, x) [x(2); -x(1)-2*p(i)*x(2)];
    [t, x] = euler_solve(ivp);
    plot(t, x(1,:), 'LineWidth', 1, 'Color', [0, 0.5, 1])
    u(i) = min(x(1,:));
end

title('Damped Oscillator')
xlabel('t')
ylabel('u(t)')
grid on

%% Lorenz 3D attractor
clear x ivp
ivp.model = @(t, x) [10*(x(2)-x(1));
                              x(1)*(28-x(3))-x(2);
                              x(1)*x(2)-8/3*x(3)];
ivp.initial_value = [1; 1; 1];
ivp.interval = [0, 30];
ivp.step_size = 0.01;
[t, x] = euler_solve(ivp);

screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, 0.5*screen/2];

figure('MenuBar', 'figure',...
       'Color', [1, 1, 1],...
       'Name', 'Lorenz System',...
       'NumberTitle', 'off',...
       'Position', figPos)

% plotting the solutions
plot3(x(1,:), x(2,:), x(3,:), 'Color', [0, 0.5, 1], 'LineWidth', 1)
grid on

hold on
N = size(x,2);
plot3(30*ones(1,N), x(2,:), x(3,:), 'Color', 0.6*[1, 1, 1])
plot3(x(1,:), 40*ones(1,N), x(3,:), 'Color', 0.6*[1, 1, 1])
plot3(x(1,:), x(2,:), 0*ones(1,N), 'Color', 0.6*[1, 1, 1])
axis('equal')
set(gca,...
    'Box', 'off',...
    'XLim', [-30, 30],...
    'YLim', [-30, 40],...
    'ZLim', [0, 60],...
    'View', [-60, 20],...
    'FontAngle', 'italic',...
    'FontName', 'Times',...
    'FontSize', 10)

title('Lorenz System')
xlabel('u(t)')
ylabel('v(t)')
zlabel('w(t)')





%% Problem 1
clc
atan(1)*180/pi
atan2(1,1)*180/pi
atan2(-1,-1)*180/pi

x = linspace(-10, 10);
plot(x, atan(x), x, atan(x)+pi, x, atan(x)-pi)
ylim([-6, 6])
arrayfun(@(y) line('XData', [-10, 10], 'YData', y*[1, 1], 'LineStyle', '--'),...
    -pi/2 + pi*(-1:2))

%% Problem 2

% finite results (numers)
disp([0/1, 0/Inf, 1^0, 0^1, 0^0, 0^Inf, Inf^0])

% infinite results
disp([1/0, -1/0, Inf/0, Inf+Inf, Inf^Inf])

% not numbers
disp([0/0, Inf/Inf, Inf-Inf, 0*Inf, 1^Inf])


%% Problem 3
clc

x = 3;
y = 7;

(x^2-y^2)/(x^3*y)
x^y - y^x
sin(pi*(x+y)) - sqrt(y-x)
log(y)/log(x)
exp(x) + exp(-x) - 2*cosh(x)
y^(1/x)

%% Problem 4
clc
mile2km = 1.60934;
x = input('Enter the distance in miles: ');
disp([num2str(x), ' miles = ', num2str(mile2km*x), ' km'])

%% Problem 5
clc
format long
uint8(5-17)
['M', 65, 84, 76, 65, 66]
int8(1-2^10)
1+0.1*eps
1+100*eps
format short

%% Problem 6
clc
0:2:20
11:-2:-11
10.^(-3:5)
2.^(0:10)
(-1).^(0:19)
linspace(0,1,6)
linspace(0, 6*2*pi/7, 8)

%% Problem 7
char(cumsum([99, 16, -10, 2, -1, -9, -33, 39, 6, -12, 8, 3, -62, 53, 12, -2]))

%% Problem 8
clc
X = randi([-10, 30], 1, 20);

X(X<0)
X(X>=7)
X(X>-5 & X<=12)
X(mod(X,2)==1)
X(mod(X,3)==0 | mod(X,7)==0)
X(mod(360,X)==0)

%% Problem 9
clc
sumN = @(n) sum(1:n);
sumN2 = @(n) sum((1:n).^2);
fact = @(n) prod(1:n); 
binom = @(n,k) prod((k+1):n)./prod(1:(n-k));
ln2 = @(n) sum(1./(1:n).*((-1).^(0:(n-1))));
solveQuad = @(a,b) [(-a + sqrt(a.^2 - 4*b)); (-a - sqrt(a.^2 - 4*b))]'/2 ;
cumAvr = @(x) cumsum(x)./(1:length(x));
first = @(x) x(1);
rest = @(x) x(2:end);
take = @(x,m) x(1:m);
drop = @(x,m) x((m+1):end);

%% Problem 10
clc
repmat(flipdim(eye(2), 2), 2, 3)
2*diag(ones(1,6)) + 5*diag(ones(1,5),1) + 7*diag(ones(1,5),-1)
(1:4)'*ones(1,4)
reshape([1:12; zeros(1, 12)], 6, [])
padarray(ones(2,3),[1, 2])
[[zeros(2, 3); 2*ones(2, 3); zeros(2, 3)], 3*ones(6, 2), [ones(3, 2); 5*ones(3, 2)]]

%% Problem 11
clc
(1:10)'*(1:10)
mod((1:10)'*(1:10), 11)


%% Problem 12
clc
X = randi([0, 50], [5, 6])

max(X)
min(X, [], 2)   % or min(X')'
sum(X, 2)
sum(X(:,2:2:end))
X(:,1)+X(:,end)
X(mod(X,2)==0)
sum(sum(X==0))
max(max(X))         % max(X(:))

take = @(x,m) x(1:m);
take(sort(X(:)), 3)

%% Problem 13
clc
take = @(x,m) x(1:m);
n = 30;
% row 1: ID
% row 2: sex    # male(1), female(2)
% row 3: age    # 20 -- 50
% row 4: score  # 0 -- 1

S = [1:n;
    randi([1, 2], 1, n);
    randi([20, 50], 1, n);
    rand([1, n])]'

%%
S(S(:,2) == 2, 1)

[~, idx] = sort(S(:,3))
X = idx(S(:,2) == 1)
S(X(1),1)
S(S(:,4)>=0.5,1)

mean(S(:,4))
std(S(:,4))

mean(S(S(:,4)<=0.2,3))

sum(S(:,2)==1) / sum(S(:,2)==2)

S(S(:,3)>35 & S(:,2)==2,1)

mean(S(S(:,3) < 37 & S(:,2)==1, 4))

X = S(:,4) >= 0.7;
sum(S(X,2)==1) / sum(S(X,2)==2)

S(S(:,2)==2 & (S(:,3)<=0.3 | S(:,2) < 40), 1)

%% Problem 14
% round table
clc
table = randi([0, 1], 1, 10)
circshift(table, [0, 1]) + ...
circshift(table, [0, 2]) + ...
circshift(table, [0, -1]) + ...
circshift(table, [0, -2])

% not round table
clc
table = randi([0, 1], 1, 10)
table = padarray(table, [0, 2]);
nb = circshift(table, [0, 1]) + ...
circshift(table, [0, 2]) + ...
circshift(table, [0, -1]) + ...
circshift(table, [0, -2]);
nb(1:2) = [];
nb(end-1:end) = [];
nb


%% Problem 15
figure()
x = linspace(-10,10,1000);
subplot(3, 1, 1)
plot(x, sin(x)./x)

x = linspace(-10,10,1000);
subplot(3, 1, 2)
plot(x, sin(1./x))


subplot(3, 1, 3)
x = linspace(0,10,1000);
plot(x, x.^2.*exp(-x).*cos(5*x))


%% Problem 16
clc
n = 100;
hist(sum(randi([1, 6], [2, n])), 2:12)

%% Problem 17
clc
n = 30;
age = randi([20, 50], 1, n);
groups = arrayfun(@(k) sum(age < k + 10 & age >= k), 20:10:40);
groups(end) = groups(end) + sum(age==50);
groups = groups/sum(groups)
pie(groups, groups == max(groups), {'20-30', '30-40', '40-50'});

%% Problem 18
close all
screenSize = get(0, 'ScreenSize')
screenSize(1:2) = [];
t = screenSize/3;
arrayfun(@(x, y) figure(...
                    'Position', [[x, y].*t, t],...
                    'MenuBar', 'none'),...
         [0, 2, 1, 0, 2], [2, 2, 1, 0, 0]);
     
%% Problem 19

% STOP

% making a new figure
screenSize = get(0, 'ScreenSize');
screenSize(1:2) = [];
figure('MenuBar', 'no',...
       'Color', [1, 1, 1],...
       'Name', 'STOP',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', [(screenSize-250*[1, 2])/2, 250*[1, 2]])
   
% making a new axes
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1],...
     'XLim', [-1.5, 1.5],...
     'YLim', [-5, 1.3])

% points of the hexagon
xs = cos(linspace(0,2*pi,7));
ys = sin(linspace(0,2*pi,7));

rectangle('Position', [-0.1 -5 0.2 3.95],...
          'FaceColor', [0.3, 0.3, 0.3],...
          'EdgeColor', [0.3, 0.3, 0.3]);

% Sign
% outer
patch('XData', 1.2*xs,...
      'YData', 1.2*ys,...
      'EdgeColor', [1, 0, 0],...
      'FaceColor', [1, 0, 0]);

% inner
patch('XData', xs,...
      'YData', ys,...
      'LineWidth', 5,...
      'EdgeColor', [1, 1, 1],...
      'FaceColor', [1, 0, 0]);

% STOP text
text('String', 'S T O P',...
     'Position', [0, 0],...
     'FontSize', 20,...
     'Color', [1, 1, 1],...
     'FontName', 'Arial',...
     'FontWeight', 'Bold',...
     'HorizontalAlignment', 'center');


%%  Owl
% 

% making a new figure
screenSize = get(0, 'ScreenSize');
screenSize(1:2) = [];
figure('MenuBar', 'no',...
       'Color', [1, 1, 1],...
       'Name', 'Owl',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', [(screenSize-500*[1, 1])/2, 500*[1, 1]])
 
% new axes
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])

% colours:
brown_light = [139, 90, 43]/255;
brown_dark = [92, 51, 23]/255;
orange = [1 0.5 0];
yellow = [1 1 0];

% left foot
rectangle('Position', [-1.8, 1.3, 1, 1],...
          'Curvature', [1, 1],...
          'FaceColor', orange,...
          'EdgeColor', 'none')
% right foot
rectangle('Position', [0.8, 1.3, 1, 1],...
          'Curvature', [1, 1],...
          'FaceColor', orange,...
          'EdgeColor', 'none')
% body
rectangle('Position', [-3, 1.5, 6, 7.5],...
          'Curvature', [1, 1],...
          'FaceColor', brown_light,...
          'EdgeColor', 'none')
% white front
rectangle('Position', [-2, 1.6, 4, 4.9],...
          'Curvature', [1, 1],...
          'FaceColor', [1, 1, 1],...
          'EdgeColor', 'none')
% head
patch('XData',[0, 2.5, -2.5],...
      'YData', [5, 9, 9],...
      'FaceColor', brown_dark,...
      'EdgeColor', 'none')
% beak
patch('XData',[0, 1, -1],...
      'YData', [5, 6.6, 6.6],...
      'FaceColor', orange,...
      'EdgeColor', 'none')
% left eye
rectangle('Position', [-1.8, 6.2, 1.6, 1.6],...
          'Curvature', [1, 1],...
          'FaceColor', yellow,...
          'EdgeColor', 'none')
% left pupil
rectangle('Position', [-1.3, 6.7, 0.6, 0.6],...
          'Curvature', [1, 1],...
          'FaceColor', [0, 0, 0],...
          'EdgeColor', 'none')
% right eye
rectangle('Position', [0.2, 6.2, 1.6, 1.6],...
          'Curvature', [1, 1],...
          'FaceColor', yellow,...
          'EdgeColor', 'none')
% right pupil
rectangle('Position', [0.7, 6.7, 0.6, 0.6],...
          'Curvature', [1, 1],...
          'FaceColor', [0, 0, 0],...
          'EdgeColor', 'none')
      
%% Problem 20

time = clock;
hour = mod(time(4)-1, 12)+1;
minute = time(5);
second = time(6);


s = linspace(0,2*pi, 500);

% making a new figure
screenSize = get(0, 'ScreenSize');
screenSize(1:2) = [];
figure(...
    'MenuBar', 'no',...
    'Color', 0.2*[0, 1, 1],...
    'Name', 'Clock',...
    'NumberTitle', 'off',...
    'NextPlot', 'add',...
    'Position', [(screenSize-500*[1, 1])/2, 500*[1, 1]])

% new axes
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1],...
     'NextPlot', 'add',...
     'XLim', 1.1*[-1, 1],...
     'YLim', 1.1*[-1, 1])

% big disk
patch(...
    'XData', cos(s),...
    'YData', sin(s),...
    'FaceColor', 0.75*[0, 1, 1],...
    'EdgeColor', 0.4*[0, 1, 1],...
    'LineWidth', 5)
%
patch(...
    'XData', 0.7*cos(s),...
    'YData', 0.7*sin(s),...
    'FaceColor', 0.7*[0, 1, 1],...
    'EdgeColor', 'none')

% ornament curves
plot((0.7+0.01*cos(60*s)).*sin(s), (0.7+0.01*cos(60*s)).*cos(s),...
    'Color', [1, 1, 1],...
    'LineWidth', 1.5)

plot((0.6+0.025*cos(24*s)).*sin(s), (0.6+0.025*cos(24*s)).*cos(s),...
    'Color', [1, 1, 1],...
    'LineWidth', 1.5)

plot((0.4+0.025*cos(12*s)).*sin(s), (0.4+0.025*cos(12*s)).*cos(s),...
    'Color', [1, 1, 1],...
    'LineWidth', 1.5)

plot((0.2+0.025*cos(6*s)).*sin(s), (0.2+0.025*cos(6*s)).*cos(s),...
    'Color', [1, 1, 1],...
    'LineWidth', 1.5)

% numbers
h = 1:12;
th = linspace(0, 2*pi, 13) - pi/3;
th(end) = [];
for  i = 1:12
    text(...
        'Position', 0.85*[cos(th(i)), -sin(th(i))],...
        'String', num2str(h(i)),...
        'Color', 0.3*[0, 1, 1],...
        'FontWeight', 'bold',...
        'FontName', 'Arial',...
        'FontSize', 18,...
        'VerticalAlignment', 'middle',...
        'HorizontalAlignment', 'center')
end


rot = @(t, u) [cos(t), -sin(t); sin(t), cos(t)]*u;

% minute hand
xdata = [0.08, 0.01, -0.01, -0.08];
ydata = 0.75*[0, 1, 1, 0];
min_pos = -2*pi*(minute/60 + second/60/60);
rot_data = rot(min_pos, [xdata;ydata]);
xdata = rot_data(1,:);
ydata = rot_data(2,:);
handles.min = patch(...
    'XData', xdata,...
    'YData', ydata,...
    'FaceColor', 0.3*[0, 1, 1],...
    'EdgeColor', 'none');

patch(...
    'XData', 0.08*cos(s),...
    'YData', 0.08*sin(s),...
    'FaceColor', 0.3*[0, 1, 1],...
    'EdgeColor', 'none')

% hour hand
xdata = [0.05, 0.01, -0.01, -0.05];
ydata = 0.6*[0, 1, 1, 0];
hour_hand = -2*pi*(hour/12+minute/60/12);
rot_data = rot(hour_hand, [xdata;ydata]);
xdata = rot_data(1,:);
ydata = rot_data(2,:);
patch(...
    'XData', xdata,...
    'YData', ydata,...
    'FaceColor', 0.4*[0, 1, 1],...
    'EdgeColor', 'none');
patch(...
    'XData', 0.05*cos(s),...
    'YData', 0.05*sin(s),...
    'FaceColor', 0.4*[0, 1, 1],...
    'EdgeColor', 'none')

% second hand
xdata = [0, 0];
ydata = [0, 0.7];
second_hand = -2*pi*second/60;
rot_data = rot(second_hand, [xdata;ydata]);
xdata = rot_data(1,:);
ydata = rot_data(2,:);

sec = line(...
    'Color', [1, 1, 1],...
    'LineWidth', 2,...
    'XData', xdata,...
    'YData', ydata);

% center disk
patch(...
    'XData', 0.025*cos(s),...
    'YData', 0.025*sin(s),...
    'FaceColor', [1, 1, 1],...
    'EdgeColor', 'none')



 
 
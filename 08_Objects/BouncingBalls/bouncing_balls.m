function bouncing_balls(n)

% obtaining screen size
scrSize = get(0, 'ScreenSize');
scrSize(1:2) = [];
scrW = scrSize(1);
scrH = scrSize(2);

% handles is a structure, containing  all the necessary handles

% figure creation
handles.fig = figure(...
    'Position', [scrW/2-scrH/4, scrH/4, scrH/2, scrH/2],...
    'Color', 0.85*[1 1 1],...
    'MenuBar', 'no',...
    'NumberTitle', 'off',...
    'Name', 'Bouncing balls');

% timer creation
dt = 0.04; % 25 frame/sec
handles.timer = timer(...
    'ExecutionMode', 'fixedSpacing',...
    'Period', dt);

% axes with limits: [0,10]
axes(...
    'Visible', 'off',...
    'XLim', [0, 10],...
    'Ylim', [0, 10],...
    'DataAspectRatio', [1, 1, 1],...
    'HitTest', 'off');

% bounding box
rectangle(...
    'Position', [0, 0, 10, 10],...
    'FaceColor', [1, 1, 1],...
    'EdgeColor', 'none',...
    'HitTest', 'off')

% ball properties:
% position, velocity, radius
% position and velocity are random 2D vectors  
% the radius is inversely proportional to the speed

balls(n).vel = [];
balls(n).pos = [];
balls(n).rad = [];

th = linspace(0, 2*pi);

handles.balls = zeros(1, n);

for i = 1:n
balls(i).pos = 8*rand(1,2)+1;
balls(i).vel = 4*rand(1,2)-2;

% creating balls
% 
% note the 'HitTest' property, set to on
% and see what happens, when you click on a ball
%
balls(i).rad = 0.2/norm(balls(i).vel);
s = rand();
handles.balls(i) = patch(...
    'XData', balls(i).pos(1) + balls(i).rad*cos(th),...
    'YData', balls(i).pos(2) + balls(i).rad*sin(th),...
    'HitTest', 'off',...
    'FaceColor', [1, 0, 0]*s + (1-s)*[0, 0, 1],...
    'EdgeColor', 'none',...
    'FaceAlpha', 0.8,...
    'UserData', balls(i));
end

% now, that all handles are readily created
% we can set the third (optional argument) to
% the structure 'handles'
set(handles.timer, 'TimerFcn', {@move_balls, handles});

% toggling the timer by clicking (stop animation)
% 
% note that any child of this figure will be
% on top of the figure, so when you click on the child
% it'll call its own 'ButtonDownFcn' callback function,
% but not the figure's 'ButtonDownFcn' function
% 
% If you want to pass the calling of the 'ButtonDownFcn'
% to the parent object, then set 'HitTest' to 'off'
% Basically this renders the object invisible to the mouse
%
set(handles.fig,...
    'ButtonDownFcn', {@toggle_timer, handles.timer},...
    'CloseRequestFcn', {@close_fig, handles.timer})
end

% auxiliary functions

% stopping the timer before closing the window
function close_fig(~,~,timer)
stop(timer)
close force
end

% moves the balls in the next position by rewriting
% the XData and YData properties for every ball
%
% this function is called by the timer, so its first
% argument is the handle to the timer
%
function move_balls(timer, ~, handles)
n = length(handles.balls);
th = linspace(0, 2*pi);
dt = get(timer, 'Period');
for i = 1:n
    ball = get(handles.balls(i), 'UserData');
    ball.pos = ball.pos + ball.vel*dt;
    if ball.pos(1) <= ball.rad
        ball.vel = ball.vel.*[-1, 1];
        ball.pos(1) = ball.rad;
    end
    if ball.pos(1) >= 10-ball.rad
        ball.vel = ball.vel.*[-1, 1];
        ball.pos(1) = 10-ball.rad;
    end
    if ball.pos(2) <= ball.rad
        ball.vel = ball.vel.*[1, -1];
        ball.pos(2) = ball.rad;
    end
    if ball.pos(2) >= 10-ball.rad
        ball.vel = ball.vel.*[1, -1];
        ball.pos(2) = 10-ball.rad;
    end
    set(handles.balls(i),...
        'UserData', ball,...
        'XData', ball.pos(1) + ball.rad*cos(th),...
        'YData', ball.pos(2) + ball.rad*sin(th));
end
end

% toggle the timer (on/off), hence stopping the animation
% (and the simulation)
%
% this function is called at mouse click
% 
function toggle_timer(~, ~, timer)
switch get(timer, 'Running')
    case 'on'
        stop(timer)
    case 'off'
        start(timer)
end

end
    
    











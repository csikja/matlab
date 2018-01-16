function bouncing_balls_gravity
scrSize = get(0, 'ScreenSize');
scrSize(1:2) = [];
scrW = scrSize(1);
scrH = scrSize(2);

% figure
handles.fig = figure(...
    'Position', [scrW/2-scrH/4, scrH/4, scrH/2, scrH/2],...
    'Color', 0.9*[1 1 1],...
    'MenuBar', 'no',...
    'NumberTitle', 'off',...
    'Name', 'Bouncing balls with gravity',...
    'MenuBar', 'no');

% axes
handles.ax = axes(...
    'Visible', 'off',...
    'Position', [0.1, 0.1, 0.8, 0.8],...
    'XLim', [-1, 11],...
    'Ylim', [-1, 11],...
    'HitTest', 'off',...
    'DataAspectRatio', [1, 1, 1]);

% frame
handles.frame = patch(...
    'XData', [0, 10, 10, 0, 0],...
    'YData', [0, 0, 10, 10, 0],...
    'FaceColor', [1, 1, 1],...
    'EdgeColor', [0, 0, 0],...
    'HitTest', 'off');

% arrow
handles.arrow = annotation('arrow', [0, 0], [0, 0]);
set(handles.arrow,...
    'Parent', handles.ax,...
    'UserData', false,...
    'HeadLength', 100,...
    'HeadWidth', 100,...
    'HeadStyle', 'vback1',...
    'Visible', 'off');

% handles of the balls
handles.ball = [];

% T = 0.04 sec -> 25 frame/sec
dt = 0.04;
handles.timer = timer(...
    'ExecutionMode', 'fixedRate',...
    'Period', dt);
set(handles.timer, 'TimerFcn', {@move_ball, handles});

% setting callback functions
set(handles.fig,...
    'ButtonDownFcn', {@init, handles},...
    'WindowButtonMotionFcn', {@draw_arrow, handles},...
    'WindowButtonUp', {@stop_arrow, handles},...
    'CloseRequestFcn', {@close_fig, handles});
    function close_fig(~, ~, handles)
        stop(handles.timer)
        close force
    end

% start timer
start(handles.timer);
end



function init(~, ~, handles)
% initialize new ball

% mouse position
mouse_pos = get(handles.ax, 'CurrentPoint');
mouse_pos = mouse_pos(1,1:2);

% displaying the arrow
% UserData: mouse button down -> true
set(handles.arrow, 'X', mouse_pos(1)*[1, 1], 'Y', mouse_pos(2)*[1, 1])
set(handles.arrow, 'Visible', 'on', 'UserData', true);

% new ball properties
ball.pos = mouse_pos;
ball.vel = [0, 0];
ball.damp = 0.6;
ball.radius = 0.3;
ball.state = 'stop';   % bounce/roll/stop

% adding new ball to the array containing the balls' handles
handles.ball(end+1) = patch(...
    'XData', ball.pos(1) + ball.radius*cos(linspace(0,2*pi)),...
    'YData', ball.pos(2) + ball.radius*sin(linspace(0,2*pi)),...
    'FaceAlpha', 0.7,...
    'FaceColor', [0, 0.6, 0],...
    'EdgeColor', 'none',...
    'UserData', ball,...
    'HitTest', 'off');
% updating handles input of the callback functions
set(handles.fig,...
    'ButtonDownFcn', {@init, handles},...
    'WindowButtonMotionFcn', {@draw_arrow, handles},...
    'WindowButtonUp', {@stop_arrow, handles})
set(handles.timer, 'TimerFcn', {@move_ball, handles});
end



function draw_arrow(~, ~, handles)
% drawing the arrow
% arrow UserData: mouse button down -> true
%                 mouse button up -> false
%
if get(handles.arrow, 'UserData')
    head_pos = get(handles.ax, 'CurrentPoint');
    head_pos = head_pos(1,1:2);
    arrow_x = get(handles.arrow, 'X');
    arrow_y = get(handles.arrow, 'Y');
    arrow_x(2) = head_pos(1);
    arrow_y(2) = head_pos(2);
    
    % color parameter: arrow length = 0 -> t = 0 -> blue
    %                  arrow length >= 8 -> t = 1 -> red
    t = min([1, ((arrow_x*[1;-1])^2 + (arrow_y*[1;-1])^2)/8^2]);
    set(handles.arrow,...
        'X', arrow_x,...
        'Y', arrow_y,...
        'Color', (1-t)*[0, 0, 1] + t*[1, 0, 0])
    set(handles.ball(end), 'FaceColor', (1-t)*[0, 0, 1] + t*[1, 0, 0]);
end
end




function stop_arrow(~, ~, handles)

% switch off arrow, and set UserData to false (mouse button up)
set(handles.arrow, 'Visible', 'off', 'UserData', false)

% compute the initial velocity of the ball from the arrow
ball = get(handles.ball(end), 'UserData');
ball.vel = 2*[diff(get(handles.arrow, 'X')), diff(get(handles.arrow, 'Y'))];

% change the state of the ball to 'bounce'
ball.state = 'bounce';

% save ball data
set(handles.ball(end), 'UserData', ball);

end


%
% Move ball
%

function move_ball(obj, ~, handles)

if isempty(handles.ball)
    return
end

dt = obj.Period;
g = 9.81;
xlim = [0, 10];
ylim = [0, 10];
n = length(handles.ball);


for i = 1:n
    ball = get(handles.ball(i), 'UserData');
    switch ball.state
        case 'stop'
            continue
        case 'bounce'
            ball.pos(2) = max([ylim(1)+ball.radius, ball.pos(2) + ball.vel(2)*dt - dt^2*g/2]);
            ball.vel(2) = ball.vel(2) - dt*g;
            ball.pos(1) = ball.pos(1) + ball.vel(1)*dt;
        case 'roll'
            ball.pos(1) = ball.pos(1) + ball.vel(1)*dt - 0.5*sign(ball.vel(1))*dt^2;
            ball.vel(1) = ball.vel(1) - dt*0.5*sign(ball.vel(1));
    end
    
    if (ball.pos(1) <= xlim(1)+ball.radius) && ball.vel(1)<0
        ball.pos(1) = xlim(1)+ball.radius;
        ball.vel(1) = -ball.damp*ball.vel(1);
    end
    if (ball.pos(1) >= xlim(2)-ball.radius) && ball.vel(1)>0
        ball.pos(1) = xlim(2)-ball.radius;
        ball.vel(1) = -ball.damp*ball.vel(1);
    end
    
    if (ball.pos(2) <= ylim(1)+ball.radius) && ball.vel(2)<0
        ball.pos(2) = ylim(1)+ball.radius;
        ball.vel(2) = -ball.damp*ball.vel(2);
    end
    
    if (ball.pos(2) >= ylim(2)-ball.radius) && ball.vel(2)>0
        ball.pos(2) = ylim(2)-ball.radius;
        ball.vel(2) = -ball.damp*ball.vel(2);
    end
    
    if strcmp(ball.state, 'bounce') && (ylim(1) + ball.radius - ball.pos(2))^2 + ball.vel(2)^2 < 0.1^2
        ball.pos(2) = ylim(1) + ball.radius;
        ball.vel(2) = 0;
        ball.state = 'roll';
        %fprintf('roll ball-%i\n', i)
    end
    
    if strcmp(ball.state, 'roll') && abs(ball.vel(1)) < 0.01
        ball.state = 'stop';
        %fprintf('stop ball-%i\n', i)
    end
    
    set(handles.ball(i),...
        'XData', ball.pos(1) + ball.radius*cos(linspace(0,2*pi)),...
        'YData', ball.pos(2) + ball.radius*sin(linspace(0,2*pi)))
    
    set(handles.ball(i), 'UserData', ball);
end
end







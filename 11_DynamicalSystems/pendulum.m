function pendulum(frc, len)

res = get(0, 'ScreenSize');
handles = struct('mainFigure', [], 'axes', [], 'rod', [], 'bob', [], 'pivot', []);

handles.mainFigure = figure('MenuBar', 'none',...
    'Color', 'white',...
    'Name', 'Pendulum',...
    'NumberTitle', 'off',...
    'NextPlot', 'add',...
    'Position', round([0.2*res(3), 0.2*res(4), 0.6*res(3), 0.6*res(4)]));
        
handles.axes = axes('Visible', 'on',...
    'DataAspectRatio', [1 1 1],...
    'XLim', [-2,2], 'YLim', [-2,2],...
    'Position', [0.2, 0.05, 0.7, 0.9],...
    'Color', [1, 1, 1],...
    'XTick', [],...
    'YTick', [],...
    'Box', 'on');

handles.StartSim = uicontrol('Units', 'Normalized',....
    'Position', [0.05, 0.45, 0.2, 0.1],...
    'String', 'S T A R T',...
    'FontSize', 20,...
    'BackgroundColor', [0, 0.8, 0],...
    'ForegroundColor', [1, 1, 1],...
    'FontWeight', 'bold');

handles.rod = line(...
    'XData', [0, 0],...
    'YData', [0, -1.5],...
    'LineWidth', 2,...
    'Color', 0.3*[1, 1, 1]);

handles.bob = rectangle(...
    'Position', [0, -1.5, 0, 0] + [-0.1, -0.1, 0.2, 0.2],...
    'EdgeColor', 0.3*[1, 1, 1],...
    'FaceColor', [1, 1, 1],...
    'Curvature', [1, 1],...
    'LineWidth', 2,...
    'ButtonDownFcn', {@setPendulum, handles});

handles.pivot = rectangle('Position', [-0.03, -0.03, 0.06, 0.06],...
    'Curvature', [1, 1], ...
    'FaceColor', [0, 0, 0]);

set(handles.axes, 'ButtonDownFcn', {@setPendulum, handles});

% simulation parameters
% add_param('pendulum_sim', 'FrictionCoefficient', '0.5');
% add_param('pendulum_sim', 'Length', '1')
% add_param('pendulum_sim', 'initPos', '0')
% add_param('pendulum_sim', 'initVel', '0')
% simulation
set_param('pendulum_sim', 'FrictionCoefficient', num2str(frc));
set_param('pendulum_sim', 'Length', num2str(len))
set_param('pendulum_sim', 'initPos', '0')
set_param('pendulum_sim', 'initVel', '0')

            
% Timer for the animation
tim = timer('ExecutionMode', 'fixedRate',...
      'Period', 0.04,...
      'TasksToExecute', 60*25,...
      'TimerFcn', {@drawPendulum, handles, simPendulum()});

set(handles.mainFigure, 'DeleteFcn', {@closeFig, tim});
    function closeFig(~, ~, tim)
        if strcmp(tim.Running, 'on')
            stop(tim)
        end
        close force
        clc
    end

% start timer
set(handles.StartSim, 'Callback', {@runSimulation, tim, handles})

    function runSimulation(obj, ~, tim, handles)
        if strcmp(tim.Running, 'off')
            tim.TimerFcn = {@drawPendulum, handles, simPendulum()};
            start(tim)
            set(obj,'String', 'S T O P', 'BackgroundColor', [0.8, 0, 0]);
        else 
            stop(tim)
            set(obj,'String', 'S T A R T', 'BackgroundColor', [0, 0.8, 0]);
        end 
    end

end


function th = simPendulum()
N = 60*25;
time = linspace(0,N/25,N);
set_param('pendulum_sim', 'StopTime', num2str(N/25));
simOut = sim('pendulum_sim');
s = simOut.get('yout');
xsim = s.signals.values;
tsim = s.time;
th = interp1(tsim, xsim, time, 'spline');
end


function drawPendulum(obj, ~, handles, th)
setPendulum([], [], handles, th(get(obj, 'TasksExecuted')));
end


function setPendulum(~, ~, handles, varargin)
if isempty(varargin)
    th = getThetaFromMouse(handles);
    set_param('pendulum_sim', 'initPos', num2str(th));
    set_param('pendulum_sim', 'initVel', '0');
else
    th = varargin{1};
end
set(handles.rod, 'XData', [0 , 1.5*sin(th)], 'YData', [0, -1.5*cos(th)])
set(handles.bob, 'Position', [1.5*sin(th)-0.1, -1.5*cos(th)-0.1, 0.2, 0.2])
end


function th = getThetaFromMouse(handles)
pos = get(handles.axes, 'CurrentPoint');
th = atan2(pos(1,1), -pos(1,2));

end
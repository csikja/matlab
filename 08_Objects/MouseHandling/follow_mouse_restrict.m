function follow_mouse_restrict

circle = @(p, r) [p-r, 2*r, 2*r];

% shape.fun:
% f(p) = true   <==>  p is inside the shape
% f(p) = false  <==> p is not inside the shape
% p must be a column vector [px; py]
% or a matrix: [p1x, p2x, p3x, ....; p1y, p2y, p3y, ...]
%

% shape.XData = 0.5*[-1, 1, 1, -1];
% shape.YData = 0.5*[-1, -1, 1, 1];
% shape.fun = @(p) max(abs(p)) <= 0.5;

%
% shape.XData = 0.5*[1, 0, -1, 0];
% shape.YData = 0.5*[0, 1, 0, -1];
% shape.fun = @(p) abs(p(1,:)) + abs(p(2,:)) <= 0.5;

shape.XData = 0.5*cos(linspace(0,2*pi));
shape.YData = 0.5*sin(linspace(0,2*pi));
shape.fun = @(p) p(1,:).^2 + p(2,:).^2 <= 0.5^2;

scr = get(0, 'ScreenSize');
scr(1:2) = [];
fig_pos = [scr/4, scr/2];

figure(...
    'Position', fig_pos,...
    'Color', 0.8*[1, 1, 1],...
    'MenuBar', 'no',...
    'NumberTitle', 'off',...
    'Name', 'Follow the mouse resctricted to an area',...
    'WindowButtonMotionFcn' , @move_disk)

axes(...
    'Visible', 'off',...
    'DataAspectRatio', [1, 1, 1],...
    'XLim', [-1, 1],...
    'YLim', [-1, 1],...
    'HitTest', 'off')

patch(...
    'XData', shape.XData,...
    'YData', shape.YData,...
    'EdgeColor', 'none',...
    'FaceColor', [1, 1, 1],...
    'Tag', 'shape',...
    'UserData', shape,...
    'HitTest', 'off')

rectangle(...
    'Position', circle([0.5, 0.5], 0.05),...
    'FaceColor', [0, 0, 0],...
    'EdgeColor', 'none',...
    'Curvature', [1, 1],...
    'Tag', 'disk',...
    'HitTest', 'off')

end

function move_disk(~, ~)

circle = @(p, r) [p-r, 2*r, 2*r];
disk_handle = findobj('Tag', 'disk');
mouse_pos = get(gca, 'CurrentPoint');
mouse_pos = mouse_pos(1,1:2);
disk_pos = get(disk_handle, 'Position');
disk_r = disk_pos(4)/2;

shape = get(findobj('Tag', 'shape'), 'UserData');



if shape.fun(mouse_pos') 
    set(disk_handle, 'Position', circle(mouse_pos, disk_r))
else
    t = linspace(0,1,500);
    T = find(abs(diff(shape.fun(mouse_pos'*t))) == 1);
    if ~isempty(T)
        T = t(T);
        new_pos = circle(T*mouse_pos, disk_r);
    else
        new_pos = circle(mouse_pos, disk_r);
    end
        set(disk_handle, 'Position', new_pos)
end

end






























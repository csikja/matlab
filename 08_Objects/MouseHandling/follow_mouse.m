function follow_mouse

% obtaining screen size
scr = get(0, 'ScreenSize');
scr(1:2) = [];
fig_pos = [scr/4, scr/2];

% figure creation
figure(...
    'Position', fig_pos,...
    'Color', 0.9*[1, 1, 1],...
    'MenuBar', 'no',...
    'NumberTitle', 'off',...
    'Name', 'Follow the mouse',...
    'WindowButtonMotionFcn' , @move_disk)

% axes creation with limit [0,1]
axes(...
    'Visible', 'off',...
    'DataAspectRatio', [1, 1, 1],...
    'XLim', [0, 1],...
    'YLim', [0, 1])

% bounding box
rectangle(...
    'Position', [0, 0, 1, 1],...
    'EdgeColor', [0, 0, 0],...
    'FaceColor', [1, 1, 1])

% auxiliary function for drawing disk (as a curved rectangle)
circle = @(p, r) [p-r, 2*r, 2*r];

% disk
rectangle(...
    'Position', circle([0.5, 0.5], 0.03),...
    'FaceColor', [0, 0, 0],...
    'EdgeColor', 'none',...
    'Curvature', [1, 1],...
    'Tag', 'disk')

end

% this function sets the center of the disk to
% the current position of the mouse
function move_disk(~, ~)

% find the tagged object: disk
d = findobj('Tag', 'disk');

% obtain the mouse position in axes coordinates
mouse_pos = get(gca, 'CurrentPoint');
mouse_pos = mouse_pos(1,1:2);

% calculating the disk's radius
disk_pos = get(d, 'Position');
r = disk_pos(3:4)/2;

% setting the disk's position to the mouse position
set(d, 'Position', [mouse_pos-r, 2*r])

end

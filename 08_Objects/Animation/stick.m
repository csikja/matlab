scr_size = get(0, 'ScreenSize');
scr_size = scr_size(3:4);
fig_size = [600 400];
fig_pos = [(scr_size-fig_size)/2, fig_size]; 

fig = figure(...
    'Position', fig_pos);

params = [10, 20, 90, 100, 5];
params = pi*params/180;
pos = [0, 1];

axes(...
    'Visible', 'on',...
    'Position', [0, 0, 1, 1],...
    'XLim', [-10, 10],...
    'YLim', [0,10],...
    'XLimMode', 'manual',...
    'YLimMode', 'manual')

line('XData', [pos(1), pos(1)-cos(params(1))], 'YData', [pos(2), pos(2)-sin(params(1))])
line('XData', [pos(1), pos(1)+cos(params(2))], 'YData', [pos(2), pos(2)-sin(params(2))])
line('XData', [pos(1), pos(1)-sin(params(5))], 'YData', [pos(2), pos(2)+cos(params(5)+pi)])
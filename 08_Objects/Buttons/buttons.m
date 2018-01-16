%% uicontrol
%
% pushbutton

%figure creation
scr_size = get(0, 'ScreenSize');
scr_size(1:2) = [];

handles.fig = figure(...
    'MenuBar', 'none',...
    'NumberTitle', 'off',...
    'Name', 'Counting',...
    'Position', [scr_size/4, 800, 400]);

% callback functions
button_reset = @(~, ~) set(findobj('Tag', 'counter'),'String','0');
button_minus = @(~, ~) set(findobj('Tag', 'counter'),'String', num2str(str2double(get(findobj('Tag', 'counter'),'String'))-1));
button_plus = @(~, ~) set(findobj('Tag', 'counter'), 'String', num2str(str2double(get(findobj('Tag', 'counter'),'String'))+1));


button_text = {'Reset', 'Decrease', 'Increase'};
button_callback = {button_reset, button_minus, button_plus};

% for now, we put the buttons to the same position
% later we will align them, for this we need to
% collect the handles of the buttons
handles.button = zeros(1,3);
for i = 1:3
handles.button(i) = uicontrol(...
	'Style', 'pushbutton',...
    'String', button_text{i},...
    'Position', [100, 100, 150, 50],...
    'FontSize', 18,...
    'CallBack', button_callback{i});
end

% this function automatically aligns the buttons

align(handles.button, 'HorizontalAlignment', 'Fixed', 20)

% axes for the text
axes('Position', [0.4,0.2,0.5,0.6], 'Visible', 'off')

% positioning the text inside the axes
% tag this text as 'counter' to find it later
t = text('String', '0',...
     'Position', [0.5, 0.5],...
     'HorizontalAlignment', 'center',...
     'FontSize', 60,...
     'Color', [1, 0, 0],...
     'Tag', 'counter');
 
 

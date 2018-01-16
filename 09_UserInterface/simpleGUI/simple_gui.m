function simple_gui()
% This is a simple gui

% LAYOUT
% 
%

% obtaining screen size
scr_size = get(0, 'ScreenSize');
scr_size = scr_size(3:4);
fig_size = [600 400];
fig_pos = [(scr_size-fig_size)/2, fig_size]; 

% figure creation
handles.fig = figure(...
    'Position', fig_pos);

% static texts
handles.text_freq = uicontrol(...
    'Style', 'Text',...
    'Position',[20, 310, 120, 25],...
    'String', 'Frequency',...
    'FontSize', 16,...
    'FontWeight', 'Bold',...
    'FontName', 'Arial');
handles.text_amp = uicontrol(...
    'Tag', 'text_amp',...
    'Style', 'Text',...
    'Position', [20, 310, 120, 25],...
    'String', 'Amplitude',...
    'FontSize', 16,...
    'FontWeight', 'Bold',...
    'FontName', 'Arial');

% frequency slider
handles.slider_freq = uicontrol(...
    'Style', 'slider',...
    'Position', [150, 310, 200, 25]);

% amplitude slider
handles.slider_amp = uicontrol(...
    'Style', 'slider',...
    'Position', [150, 310, 200, 25]);

% axis for the sine curve
handles.axes = axes(...
    'Units', 'pixels',...
    'Position', [30, 30, 400, 250],...
    'XLim', [-3,3],...
    'YLim', [-3,3],...
    'YLimMode', 'manual',...
    'XLimMode', 'manual');

% save the handles into the figure as data
% to later retrieve it by calling 'guidata'
guidata(handles.fig, handles)

% aligning texts and sliders                                    
align([handles.text_amp, handles.text_freq],...
    'VerticalAlignment', 'Fixed', 10)
align([handles.slider_amp, handles.slider_freq],...
    'VerticalAlignment', 'Fixed', 10)

% INITIALIZATION
set(handles.slider_amp,...
    'Max', 3,...
    'Min', 0.1,...
    'Value', 1)
set(handles.slider_freq,...
    'Max', 2,...
    'Min', 0.01,...
    'Value', 1)

amp = get(handles.slider_amp, 'Value');
freq = get(handles.slider_freq, 'Value');

x = linspace(-3,3);
y = amp*sin(2*pi*freq*x);
handles.sin_curve = plot(x,y);
set(handles.axes, 'YLim', [-3,3])

% updating guidata
guidata(handles.fig, handles)



% FUNCTIONALITY
set(handles.slider_amp,...
    'Callback', @redraw)

set(handles.slider_freq,...
    'Callback', @redraw)

end

% auxiliary function to redraw the sine curve
% when the slider is moved

function redraw(~, ~)

% retreving -- the earlier saved -- handles
% the 'gcf' points to the current figure
handles = guidata(gcf);

% obtaining the value of the sliders
amp = get(handles.slider_amp, 'Value');
freq = get(handles.slider_freq, 'Value');

% redrawing the sine curve according to 
% the sliders positions
x = linspace(-3,3);
y = amp*sin(freq*2*pi*x);
set(handles.sin_curve, 'XData', x, 'YData', y);
set(handles.axes, 'YLim', [-3,3])

end


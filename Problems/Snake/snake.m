clear all
close all
clc

n = 30;
m = 20;

snake.Dir = [0; 1];
snake.XData = floor(m/2)*ones(1,4);
snake.YData = (1:4)+2;

food.X = randi([1, m]);
food.Y = randi([10, n]);

S = ones(n, m);
S(n*(snake.XData-1) + snake.YData) = 2;
S(food.Y, food.X) = 3;


screen = get(0, 'ScreenSize');
scr.w = screen(3);
scr.h = screen(4);

figPos = [floor((scr.w-(m/n)*scr.h/2)/2), scr.h/4, (m/n)*scr.h/2, scr.h/2];

handles.Fig = figure(...
    'Position', figPos,...
    'MenuBar', 'no',...
    'Color', 0.85*[1 1 1],...
    'Name', 'Snake',...
    'NumberTitle', 'off',...
    'Colormap', [1, 1, 1; 0, 0.5, 0; 0.8, 0, 0; 1, 0.5, 0],...
    'UserData', snake);

menu.Main = uimenu('Label', 'File');
menu.NewGame = uimenu(menu.Main, 'Label', 'New Game');
uimenu(menu.Main, 'Label', 'Ranking', 'Checked', 'on')

axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])

 
 
handles.Img = image('CData', S, 'HitTest', 'off');
axis('image')


score = 0;
handles.Score = text(...
    'String', sprintf('Score: %i', score),...
    'Color', 0.2*[1, 1, 1],...
    'FontSize', 14,...
    'FontName', 'Courier',...
    'FontWeight', 'Bold',...
    'VerticalAlignment', 'bottom',...
    'Position', [0.5, n+0.5],...
    'UserData', score);
handles.GO = text(...
    'String', ' G A M E    O V E R ',...
    'Color', 0.95*[1, 1, 1],...
    'BackGround', 0.2*[1, 1, 1],...
    'FontSize', 16,...
    'FontName', 'Times',...
    'FontWeight', 'Bold',...
    'VerticalAlignment', 'bottom',...
    'HorizontalAlignment', 'center',...
    'Visible', 'off',...
    'Position', [(m+1)/2,2*n/3],...
    'UserData', score);

handles.Timer = timer(...
    'ExecutionMode', 'fixedRate',...
    'Period', 0.1);

set(handles.Timer, 'TimerFcn', {@nextSnake, handles})
set(handles.Fig,...
    'KeyPressFcn', {@keyPress, handles});
set(handles.Img, 'UserData', food)
set(menu.NewGame, 'Callback', 'resetSnake([], [], handles)')

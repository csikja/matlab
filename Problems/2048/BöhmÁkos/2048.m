% PROJECT Feladat
%
% K�sz�tette: B�hm �kos
% Neptun_k�d: CINGNP
%
%
%************2048 J�t�k************

clc
clear all;
close all;

% Kezdeti inicializ�l�s
P = zeros(4,4);
P(randsample(1:16,2)) = [1,1];

screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, screen/2];

handles.fig=figure(...
    'Position', figPos,...
    'MenuBar', 'no',...
    'Color', 0.98*[1, 1, 1],...
    'Name', '2048',...
    'NumberTitle', 'off',...
    'NextPlot', 'add');

axes(...
    'Visible', 'off',...
    'DataAspectRatio', [1 1 1],...
    'XLim',[-0.4,4.4],...
    'YLim',[-0.4,4.4])

% A sz�nek be�ll�t�s�hoz haszn�lt f�ggv�ny
%r=0;g=0;b=0;
%c = uisetcolor([r g b])

rectangle(...
    'Position', [0, 0, 4, 4],...
    'Curvature', 0.05*[1, 1],...
    'EdgeColor', [0.8000,0.7765, 0.6549],...
    'FaceColor', [0.8000, 0.8000, 0.7059],...
    'LineWidth', 5)

for i=0:3
    for j=0:3
        rectangle(...
            'Position', [i, j, 1, 1],...
            'Curvature', 0.2*[1, 1],...
            'EdgeColor', [0.8000,0.7765, 0.6549],...
            'FaceColor',[0.8000, 0.8000, 0.7059] ,...
            'LineWidth', 5)
    end
end

colors=[...
    0.8000, 0.8000, 0.7059, 0;...
    0.9294 0.9137 0.8627,2;...
    0.8000 0.8000 0.6745,4;...
    1.0000 0.6824 0.2782,8;...
    0.8863 0.3020 0.0000,16;...
    1.0000 0.3098 0.2196,32;...
    0.8000 0.0627 0.0392,64;...
    1.0000 0.9647 0.6392,128;...
    1.0000 0.7922 0.3098,256;...
    1.0000 0.6314 0.0000,512;...
    1.0000 0.5216 0.0549,1024];

P=rot90(P,3);

handles.rec = zeros(4,4);
handles.txt = zeros(4,4);

for i=1:4
    for j=1:4
        handles.rec(i,j)=rectangle(...
            'Position', [i-1+0.1, j-1+0.1, 0.84,0.84],...
            'Curvature', 0.2*[1, 1],...
            'EdgeColor', colors(P(i,j)+1,1:3),...
            'FaceColor', colors(P(i,j)+1,1:3),...
            'LineWidth', 5);
        
        handles.txt(i,j)=text(...
            'Position', [(i-1+0.1)+0.42, j-1+0.1+0.4],...
            'FontSize', 20, ...
            'HorizontalAlignment', 'center');
        
        if P(i,j) > 2
            set(handles.txt(i,j),...
                'String', num2str(colors(P(i,j)+1,4)),...
                'Color', [1, 1, 1])
        elseif P(i,j) == 2 || P(i,j) == 1
            set(handles.txt(i,j),...
                'String', num2str(colors(P(i,j)+1,4)),...
                'Color', [0, 0, 0])
        end
        
    end
end

P=rot90(P,-3);

set(handles.fig, 'WindowKeypressFcn', {@keypress_callback, handles})
set(handles.fig,'UserData',P)
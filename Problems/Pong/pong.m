% pong game

%% Creating main figure

screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, screen/2];

figure(...
    'Position', figPos,...
    'MenuBar', 'no',...
    'Color', 0.90*[1 1 1],...
    'Name', 'Pong',...
    'NumberTitle', 'off')

axes('Position', [0.1, 0.1, 0.8, 0.8], 'Visible', 'off')

%%

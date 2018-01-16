n = 20;
A = logical(randi([0,1],n,n));

scr_size = get(0, 'ScreenSize');
scr_size = scr_size(3:4);

down_A = circshift(A, [1, 0]);
down_A(1,:) = 0;

up_A = circshift(A, [-1, 0]);
up_A(end,:) = 0;

right_A = circshift(A, [0, 1]);
right_A(:,1) = 0;
right_down_A = circshift(right_A, [1, 0]);
right_down_A(1,:) = 0;
right_up_A = circshift(right_A, [-1, 0]);
right_up_A(end,:) = 0;

left_A = circshift(A, [0, -1]);
left_A(:,end) = 0;
left_down_A = circshift(left_A, [1, 0]);
left_down_A(1, :) = 0;
left_up_A = circshift(left_A, [-1, 0]);
left_up_A(end,:) = 0;

neighbours = down_A + up_A + left_A + left_down_A + left_up_A + right_A + right_down_A + right_up_A;
next_A = (neighbours == 3 ) | ((neighbours == 2) & A);


figure(...
    'MenuBar', 'none',...
    'Name', 'Game of Life: original generation',...
    'NumberTitle', 'off',...
    'Position', [scr_size/4, scr_size./[4, 2]],...
    'Color', 0*[1, 1, 1],...
    'Colormap', [0, 0, 0; 1, 1, 1])
axes('Visible', 'off')
image('CData', A);
axis('image')


figure(...
    'MenuBar', 'none',...
    'Name', 'Game of Life: next generation',...
    'NumberTitle', 'off',...
    'Position', [scr_size/4+[scr_size(1), 0]/4, scr_size./[4, 2]],...
    'Color', 0*[1, 1, 1],...
    'Colormap', [0, 0, 0; 1, 1, 1])
axes('Visible', 'off')
image('CData', next_A);
axis('image')
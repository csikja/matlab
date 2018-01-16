function resetSnake(~, ~, handles)

[n,m] = size(get(handles.Img, 'CData'));

snake.Dir = [0; 1];
snake.XData = floor(m/2)*ones(1,4);
snake.YData = (1:4)+2;


food.X = randi([1, m]);
food.Y = randi([10, n]);

S = ones(n, m);
S(n*(snake.XData-1) + snake.YData) = 2;
S(food.Y, food.X) = 3;

set(handles.Fig, 'UserData', snake);
set(handles.Img, 'UserData', food, 'CData', S);
set(handles.Score, 'UserData', 0, 'String', 'Score: 0')
set(handles.GO, 'Visible', 'off')

end
function nextSnake(~, ~, handles)

% keys: 1: left
%       2: right
%       3: up
%       4: down

key = uint8(get(handles.Fig, 'CurrentCharacter'))-27;

if isempty(key)
    key = 0;
end

snake = get(handles.Fig, 'UserData');
food = get(handles.Img, 'UserData');
S = get(handles.Img, 'CData');
[n, m] = size(S);

if (key == 1 && ~all(snake.Dir == [1; 0]))
    snake.Dir = [-1; 0];
elseif (key == 2 && ~all(snake.Dir == [-1; 0]))
    snake.Dir = [1; 0];
elseif (key == 3 && ~all(snake.Dir == [0; -1]))
    snake.Dir = [0; 1];
elseif (key == 4 && ~all(snake.Dir == [0; 1]))
    snake.Dir = [0; -1];
end

next.X = snake.XData(end) + snake.Dir(1);
if next.X <=0
    next.X = m;
elseif next.X > m
    next.X = 1;
end

next.Y = snake.YData(end) + snake.Dir(2);
if next.Y <=0
    next.Y = n;
elseif next.Y > n
    next.Y = 1;
end

% checking food
if  next.X == food.X &&  next.Y == food.Y
    snake.XData(end+1) = next.X;
    snake.YData(end+1) = next.Y;
    v = 1:(m*n);
    v((snake.XData-1)*n + snake.YData) = [];
    a = randsample(v,1);
    food.X = floor((a-1)/n)+1;
    food.Y = a-n*floor((a-1)/n);
    set(handles.Img, 'UserData', food);
    score = get(handles.Score, 'UserData') + 1;
    set(handles.Score, 'String', sprintf('Score: %i', score), 'UserData', score);
else
    snake.XData = circshift(snake.XData, [0, -1]);
    snake.XData(end) = next.X;
    snake.YData = circshift(snake.YData, [0, -1]);
    snake.YData(end) = next.Y;
end

snake.XData(snake.XData > m) = 1;
snake.XData(snake.XData <= 0) = m;
snake.YData(snake.YData > n) = 1;
snake.YData(snake.YData <= 0) = n;

set(handles.Fig, 'UserData', snake);
SS = zeros(n, m);
SS(n*(snake.XData-1) + snake.YData) = 2;
SS(food.Y, food.X) = 3;

% checking if the snake crosses itself
if any((snake.XData(1:end-1) == snake.XData(end)) & (snake.YData(1:end-1) == snake.YData(end)))
    stop(handles.Timer)
   SS(n*(snake.XData-1) + snake.YData) = 4;
   set(handles.GO, 'Visible', 'on')
end

set(handles.Img, 'CData', SS);


end
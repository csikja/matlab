function changeDirection(obj, ~)

% keys: 1: left
%       2: right
%       3: up
%       4: down

key = uint8(get(obj, 'CurrentCharacter'))-27;
snake = get(obj, 'UserData');

if (key == 1 && ~all(snake.dir == [1; 0]))
    snake.dir = [-1; 0];
elseif (key == 2 && ~all(snake.dir == [-1; 0]))
    snake.dir = [1; 0];
elseif (key == 3 && ~all(snake.dir == [0; -1]))
    snake.dir = [0; 1];
elseif (key == 4 && ~all(snake.dir == [0; 1]))
    snake.dir = [0; -1];
end

set(obj, 'UserData', snake);

disp(snake.shape)
disp(snake.dir)


end
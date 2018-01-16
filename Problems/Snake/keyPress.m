function keyPress(~, ~, handles)

switch get(handles.Fig, 'CurrentCharacter')
    case ' '
        startSnake([], [], handles);
end

end
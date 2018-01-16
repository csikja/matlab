function startSnake(~, ~, handles)

if strcmp('off', get(handles.Timer, 'Running')) && strcmp('off', get(handles.GO, 'Visible'))
    start(handles.Timer);
elseif strcmp('on', get(handles.Timer, 'Running')) 
    stop(handles.Timer);
end

end
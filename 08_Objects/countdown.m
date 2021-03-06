function countdown(n)

% timer creation
handles.timer = timer(...
    'ExecutionMode', 'fixedRate',...
    'Period', 1,...
    'StartDelay', 1,...
    'TasksToExecute', n);

% figure creation
figure(...
    'Position', [400, 100, 500, 500],...
    'Color', [1 1 1],...
    'CloseRequestFcn', {@closefig, handles});

% axes creation
axes(...
    'Visible', 'off',...
    'XLim', [-10, 10],...
    'Ylim', [-10, 10]);

% 
handles.counter = text(...
    'String', num2str(n),...
    'FontSize', 70,...
    'Color', [1 0 0],...
    'HorizontalAlignment', 'center',...
    'VerticalAlignment', 'middle');

set(handles.timer, 'TimerFcn', {@count, handles});
start(handles.timer)

end



function count(~, ~, handles)
% decreasing the counter value by one
% and setting the new value

new_c = str2double(get(handles.counter, 'String'))-1;
set(handles.counter, 'String', num2str(new_c));
end

% stopping the timer before closing the window
function closefig(~,~, handles)
stop(handles.timer)
close force
end
function keypress_callback(obj, evnt, handles)

X = get(obj, 'UserData');

switch evnt.Key
    case 'leftarrow'
        Y = merge(X, 'left');
    case 'rightarrow'
        Y = merge(X, 'right');
    case 'downarrow'
        Y = merge(X, 'down');
    case 'uparrow'
        Y = merge(X, 'up');
end

new_tile = [2, 2, 2, 2, 4];

if ~all(all(X == Y))
    idx = find(Y == 0);
        Y(randsample(idx,1)) = new_tile(randi([1, 5]));
        draw_table(Y, handles)
elseif isempty(find(Y == 0))
    answer = questdlg('Game Over', '2048', 'Reset', 'Continue', 'Reset');
    switch answer
        case 'Reset'
        X=zeros(4,4);
        X(randi([1,numel(X)])) = 2;
        draw_table(X, handles);        
        otherwise
            
    end
end


    
end

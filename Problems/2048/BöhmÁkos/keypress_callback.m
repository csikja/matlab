function keypress_callback(obj, evnt, handles)

P = get(handles.fig,'UserData');
U = get(handles.fig,'UserData');

switch evnt.Key
    
    case 'leftarrow'
        P = merge(P);
    
    case 'rightarrow'
        P = flipdim(P,2);
        P = merge(P);
        P = flipdim(P,2);
    
    case 'uparrow'
        P = rot90(P,1);
        P = merge(P);
        P = rot90(P,-1);
    
    case 'downarrow'
        P = rot90(P,-1);
        P = merge(P);
        P = rot90(P,1);
        
end

V = find(P == 0);

if U == P
    
    if length(V) == 0
        
        Ubalra = merge(P);
        
        Ufel = rot90(P,1);
        Ufel = merge(Ufel);
        Ufel = rot90(Ufel,-1);
                
        if Ubalra == P
            
            if Ufel == P
                button = questdlg('Game Over','2048','New Game','Continue','End Game','New Game');
                
                switch button
                    case 'New Game'
                        P = zeros(4,4);
                        P(randsample(1:16,2)) = [1,1];
                        set(handles.fig,'UserData', P)
                        drawTable(P, handles);
                    case 'Continue'
                        drawTable(P, handles);
                    case 'End Game'
                        close all
                end
                
            else
                set(handles.fig,'UserData', P);
                drawTable(P, handles);
            end
            
        elseif Ufel == P
            
            if Ubalra == P
                button = questdlg('Game Over','2048','New Game','Continue','End Game','New Game');
                
                switch button
                    case 'New Game'
                        P = zeros(4,4);
                        P(randsample(1:16,2)) = [1,1];
                        set(handles.fig,'UserData', P)
                        drawTable(P, handles);
                    case 'Continue'
                        drawTable(P, handles);
                    case 'End Game'
                        close all
                end
                
            else
                set(handles.fig,'UserData', P);
                drawTable(P, handles);
            end
            
        else
            set(handles.fig,'UserData', P);
            drawTable(P, handles);
        end
        
    else
        set(handles.fig,'UserData', P);
        drawTable(P, handles);
    end
    
else
    P(randsample(find(P == 0),1)) = randi([1,2]);
    set(handles.fig,'UserData', P);
    drawTable(P, handles);
end

end
function drawPlant(vars, angle, str)

[moves, stackOp] = strsplit(str, {'[',']'});
k = [0, 0];
if strcmp(moves{1}, '')
    k(1) = 1;
end
if strcmp(moves{end}, '')
    k(2) = 1;
end


% determining the stack size
br=str(str==']'|str=='[');
d = zeros(1,length(br));
d(br == '[') = 1;
d(br == ']') = -1;
stackDepth = max(cumsum(d));


state = [0;0;pi/2];
stack = zeros(3,stackDepth);
stc = 0;

figure(...
    'Color', [1, 1, 1],...
    'MenuBar', 'no')
axes(...
    'Visible', 'off',...
    'NextPlot', 'add',...
    'DataAspectRatio', [1, 1, 1]);


for i=1:length(moves) 
    if (i>1 || ~k(1)) && (i<length(moves) || ~k(2))
        state = drawLSystem(vars, angle, moves{i}, state);
    end
    if length(stackOp) >= i
        for j = 1:length(stackOp{i})
            switch stackOp{i}(j)
                case '['
                    stc = stc + 1;
                    stack(:,stc) = state;
                case ']'
                    state = stack(:,stc);
                    stc = stc - 1;
            end
        end
    end
end

end
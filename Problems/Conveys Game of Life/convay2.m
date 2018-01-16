function convay2(n)
A = logical(randi([0,1],n,n));

screenSize = get(0, 'ScreenSize');
screenSize = screenSize(3:4);

figure(...
    'MenuBar', 'none',...
    'Name', 'Convey Game of Life',...
    'NumberTitle', 'off',...
    'Position', [screenSize/4, screenSize/2],...
    'Color', [1, 1, 1],...
    'Colormap', [1, 1, 1; 0, 0, 0],...
    'CloseRequestFcn', @closeFig)

    function closeFig(~, ~)
        stop(t)
        close force
    end

axes('Visible', 'off',...
    'DataAspectRatio', [1 1 1])
image('CData', A);
axis('image')

t = timer(...
    'Period', 0.1,...
    'ExecutionMode', 'fixedRate',...
    'TimerFcn', @callback_nextGen,...
    'StartDelay', 2);
start(t)
end


function callback_nextGen(~, ~)
im_handle = get(gca, 'Children');
A = get(im_handle, 'CData');
set(im_handle, 'CData', nextGeneration(A))
end



function nextGenA = nextGeneration(A)

downA = circshift(A, [1, 0]);
downA(1,:) = 0;

upA = circshift(A, [-1, 0]);
upA(end,:) = 0;

rightA = circshift(A, [0, 1]);
rightA(:,1) = 0;
rightDownA = circshift(rightA, [1, 0]);
rightDownA(1,:) = 0;
rightUpA = circshift(rightA, [-1, 0]);
rightUpA(end,:) = 0;

leftA = circshift(A, [0, -1]);
leftA(:,end) = 0;
leftDownA = circshift(leftA, [1, 0]);
leftDownA(1, :) = 0;
leftUpA = circshift(leftA, [-1, 0]);
leftUpA(end,:) = 0;

neighbours = downA + upA + leftA + leftDownA + leftUpA + rightA + rightDownA + rightUpA;

nextGenA = (neighbours == 3 ) | ((neighbours == 2) & A);

end


function convay(n)
A = logical(randi([0,1],n,n));

screenSize = get(0, 'ScreenSize');
screenSize = screenSize(3:4);

figure(...
    'MenuBar', 'none',...
    'Name', 'Convey Game of Life',...
    'NumberTitle', 'off',...
    'Position', [screenSize/4, screenSize/2],...
    'Color', [1, 1, 1],...
    'Colormap', [1, 1, 1; 0, 0, 0])
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])
image(...
    'CData', A,...
    'ButtonDownFcn', @callback_nextGen)
axis('image')
end


function callback_nextGen(obj, ~)
A = get(obj, 'CData');
set(obj, 'CData', nextGeneration(A))
end



function nextGenA = nextGeneration(A)

n = length(A);


padA = padarray(A, [1, 1]);
getNeighbours = @(i, j) sum(sum(padA((i-1):(i+1),(j-1):(j+1))))-padA(i,j);
rowIndex = (2:(n+1))'*ones(1,n);
colIndex = ones(n,1)*(2:(n+1));
neighbours = arrayfun(getNeighbours, rowIndex, colIndex);

nextGenA = (neighbours == 3) | ((neighbours == 2) & A);

end


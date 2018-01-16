n = 500;

A = logical(randi([0,1],n,n));


padA = padarray(A, [1, 1]);
getNeighbours = @(i, j) sum(sum(padA((i-1):(i+1),(j-1):(j+1))))-padA(i,j);
rowIndex = (2:(n+1))'*ones(1,n);
colIndex = ones(n,1)*(2:(n+1));
neighbours = arrayfun(getNeighbours, rowIndex, colIndex);

nextGenA = (neighbours == 3 ) | ((neighbours == 2) & A);
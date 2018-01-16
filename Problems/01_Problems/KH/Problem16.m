f = 6;     % number of faces of 1 die
d = 2;    % number of dice
t = 100;  % number of throws


DieRoll = @(x) floor(f*rand(1,1))+1;
OneThrow = @(x) sum(arrayfun (DieRoll,1:d));

bins = [d:d*f];
hist(arrayfun (OneThrow,1:t),bins);


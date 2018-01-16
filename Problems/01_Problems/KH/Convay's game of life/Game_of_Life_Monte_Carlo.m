% Conway's Game of life
% Development of ratio of life cells

clc
n = 50; % size of grid
r = 0.4; % ratio of live cells in random grid
g = 100; % number of new generations

curr_field = floor(rand(n,n)+r);

no_of_live_cells = @(f) sum(sum(f));
d = no_of_live_cells(curr_field);
% d: development over time

for N = 1:g
    curr_field = next_generation(curr_field);
    d = [d, no_of_live_cells(curr_field)];    
end

plot (1:g+1,d./n^2.*100, 'or');
%plot percentage of live cells




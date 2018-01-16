function fate = cell_fate(neighborhood)
%input parameter = 3x3 matrix with field of interest in the middle

middle_cell = neighborhood(2,2);
sum_of_neighbors = sum(sum(neighborhood)) - middle_cell;

if (middle_cell == 1) % middle cell is alive
    if (sum_of_neighbors == 2 | sum_of_neighbors == 3)
        fate = 1;
    else
        fate = 0;
    end
    
else %middle cell is dead
    if (sum_of_neighbors == 3)
        fate = 1;
    else
        fate = 0;
    end
    
end
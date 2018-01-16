function new_field = next_generation(field)
[n1,n2] = size(field);

% add border
add_border = @(f) [zeros(1,n2+2);[zeros(n1,1),f,zeros(n1,1)];zeros(1,n2+2)];
larger_field = add_border(field);

% neighborhood
neighborhood = @(r,c) larger_field (r-1:r+1, c-1:c+1);

new_field = zeros(n1,n2);
for i = (1:n1)
    for j = (1:n2)
        new_field(i,j)=cell_fate(neighborhood(i+1,j+1));
    end
end

end

% arrayfun(neighborhood,(1:n)+1,(1:n)+1,'UniformOutput',false);
% cell array containing 3x3 matrices
% 1:n+1 covers all original cells without the dead border cells included in
% larger_field
% but only covers rows (or columns?) I didn't manage a nested arrayfun, so
% I used for loops

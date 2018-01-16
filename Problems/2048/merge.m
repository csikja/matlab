function Y = merge(X, varargin)

if nargin == 2
    dir = varargin{1};
else
    dir = 'left';
end


T.up = @rot90;
T.right = @fliplr;
T.down = @(X) rot90(X,-1);
T.left = @(X) X;


X = T.(dir)(X);

m = size(X,2);
X = shift(X);


for j = 1:(m-1)
    idx = find(X(:,j) == X(:,j+1));
    X(idx, [j,j+1]) = [sum(X(idx,[j,j+1]),2), zeros(length(idx),1)];
end

if all(strcmp(dir,'up'))
    dir = 'down';
elseif all(strcmp(dir,'down'))
    dir = 'up';
end

Y = T.(dir)(shift(X));

end




function Y = shift(X)

[n, m] = size(X);

for j = 1:(m-1)
    shifts = min(sum(cumsum(X(:,j:end)')==0), 4-j);
    for i = 1:n
        X(i,:) = [X(i,1:(j-1)), circshift(X(i,j:end),[0,-shifts(i)])];
    end
end

Y = X;

end
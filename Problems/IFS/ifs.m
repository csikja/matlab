function varargout = ifs(ifs_data, varargin)
S = ifs_data.initial_shape;
A = ifs_data.transformation;
b = ifs_data.dilation;
N = ifs_data.step;

n = length(A);

% defining the contraction maps: F(u) =A*u+b
F = cell(1,n);
for i = 1:length(A)
    F{i} = @(u) reshape(A{i}*reshape(u,2,[]) + repmat(b{i}, 1, size(u,1)/2*size(u,2)), size(u,1), []);
end

X = S;
for k = 1:N
    S = X;
    X=[];
    for i = 1:n
        X = cat(2,X,F{i}(S));
    end
end


switch nargout
    case 0
        figure('Color', [1, 1, 1],...%'MenuBar', 'no',...
            'NumberTitle', 'off')
        axes('Visible', 'Off')
        for i = 1:size(X,2)
            T = reshape(X(:,i), 2, []);
            patch(...
                'XData', T(1,:),...
                'YData', T(2,:),...
                'EdgeColor', 'No',...
                varargin{:})
        end
        axis equal
    case 1
        varargout{1} = X;
end
end
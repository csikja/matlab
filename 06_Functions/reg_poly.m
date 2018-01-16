function points = reg_poly(n,fi)
% draw a regular polygon

switch nargin
    case 0
        n = 5;
        fi = 0;
    case 1
        fi = 0;
end

th = linspace(0, 2*pi, n+1) + fi;
x = cos(th);
y = sin(th);

switch nargout
    case 0
        screen = get(0, 'ScreenSize');
        screen(1:2) = [];
        fig_size = [400, 400];
        fig_pos = [screen/2-fig_size/2, fig_size];
        figure(...
            'Position', fig_pos,...
            'MenuBar', 'no',...
            'Color', [1 1 1],...
            'Name', ['Regular ', num2str(n), '-gon'],...
            'NumberTitle', 'off')
        axes(...
            'Visible', 'off',...
            'DataAspectRatio', [1, 1, 1])
        patch(...
            'XData', x,...
            'YData', y,...
            'FaceColor', [0.2, 0.6, 1],...
            'EdgeColor', 'none')
    case 1
        points = [x;y];
end


end


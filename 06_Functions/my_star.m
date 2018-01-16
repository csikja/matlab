function varargout = my_star(n, varargin)
% 
% my_star(n,r) draws an n-pointed star with inner radius r
% my_star(n) same as before with r=0.5
% [x,y] = my_star(n) returns with the  verticies of an n-pointed star
%
%

% checking the number of input and output arguments
narginchk(1, 2)
nargoutchk(0, 2)


% optional input
switch nargin
    case 1
        r = 0.5;
    case 2
        r = varargin{1};
end

% calculating the vertices
[starX, starY] = get_star(n, r);

% optional outputs
switch nargout
    case 1
        error('Not enough output...')
    case 2
        varargout{1} = starX;
        varargout{2} = starY;
        return
end


% drawing the star using patch

screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [screen/4, screen/2];
figure(...
    'Position', figPos,...
    'MenuBar', 'no',...
    'Color', [1 1 1],...
    'Name', 'Star',...
    'NumberTitle', 'off')
axes(...
    'Visible', 'off',...
    'DataAspectRatio', [1, 1, 1])
    
patch(...
    'XData', starX,...
    'YData', starY,...
    'FaceColor', [0.2, 0.6, 1],...
    'EdgeColor', 'none')

end


% auxulary function computing the verticies

function [starX, starY] = get_star(n, r)

fi = pi/2-2*pi/5;
th = linspace(0, 2*pi, n+1) + fi;

x = cos(th);
y = sin(th);

xx = r*cos(th+pi/n);
yy = r*sin(th+pi/n);
starX = reshape([x;xx], 1, 2*(n+1));
starY = reshape([y;yy], 1, 2*(n+1));

end



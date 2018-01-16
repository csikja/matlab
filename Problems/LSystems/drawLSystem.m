function varargout = drawLSystem(vars, angle, str, varargin)

angle = angle*pi/180;

s = zeros(3,length(str));
turnR = str == '+';
turnL = str == '-';

drawF = logical(zeros(1,length(str)));
for i=1:length(vars)
    drawF = (drawF | str == vars(i));
end


switch nargin
    case 3
        x0 = 0;
        y0 = 0;
        angle0 = 0;
    otherwise
        x0 = varargin{1}(1);
        y0 = varargin{1}(2);
        angle0 = varargin{1}(3);
end

s(:,turnR) = repmat([0; 0; angle], 1, sum(turnR));
s(:,turnL) = repmat([0; 0; -angle], 1, sum(turnL));

d = 1;
s(3,:) = cumsum(s(3,:)) + angle0;
s(1,drawF) = d*cos(s(3, drawF));
s(2,drawF) = d*sin(s(3, drawF));

x = [x0, cumsum(s(1,drawF))+x0];
y = [y0, cumsum(s(2,drawF))+y0];

switch nargout
    case 0
        figure(...
            'Color', [1, 1, 1],...
            'MenuBar', 'no')
        axes(...
            'Visible', 'off',...
            'NextPlot', 'add',...
            'DataAspectRatio', [1, 1, 1]);
        plot(x,y, 'k')
    case 1
        varargout{1} = [x(end); y(end); s(3,end)];
        plot(x, y, 'k')
end

end
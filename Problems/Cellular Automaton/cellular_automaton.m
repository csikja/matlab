function varargout = cell_automata(rule, s, varargin)
% Evolve a cellular automaton with the given rule for n steps
% try the following rules:
% 50, 54
% 60, 90
% 110, 30

% checking the proper number of input arguments
narginchk(2, 3)
nargoutchk(0,1)

rule = min(rule, 255);
rule = max(rule,0);

switch size(s,2)
    case 1
        n = s;
        X = char(ones(n,n)*'0');
    case 2
        n = s(1);
        m = s(2);
        X = char(ones(n,m)*'0');
    otherwise
        error('The size must be a scalar or a 1x2 matrix.')
end
r = rule;

% converting rule number to string of 0-1
rule = dec2base(rule,2,8);
rule = flipdim(rule,2);


% choosing initial condition
switch nargin
    case 2
        X(1,1) = '1';
    case 3
        X(1,varargin{1}) = '1';
end

% applying the rules 
for i = 2:n   
   x = ['0', X(i-1,:), '0'];
   y = [circshift(x, [0, -1]); x; circshift(x, [0, 1])]';
   y = rule(base2dec(y,2)+1);
   X(i,:) = y(2:end-1);
end

switch nargout
    case 0
        % display of the result
        screenSize = get(0, 'ScreenSize');
        screenSize = screenSize(3:4);
        
        figure(...
            'Name', ['Cellular Automata: Rule-', num2str(r)],...
            'NumberTitle', 'off',...
            'Position', [screenSize/4, 0.5*screenSize/2],...
            'Color', [1, 1, 1],...
            'Colormap', [1, 1, 1; 0, 0, 0])
        axes('Visible', 'off',...
            'DataAspectRatio', [1 1 1])
        image(...
            'CData', flipdim(uint8(X)-'0',1))
        axis('image')
    case 1
        varargout{1} = uint8(X)-'0';
end
end
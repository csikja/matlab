function varargout = my_solver(data)
% Finds a solution for the equation f(x) = 0 in the interval [a,b]
% assuming that f is continuous and f(a)f(b) < 0.
% The input is a structure with the following fields:
% data.interval is an array [a,b]
% data.function is a function handle for f
%
% my_solver(data) plots the function and marks the solution on it
% x = my_solver(data) returns the solution
%
% Example (square root of 2)
% 
% >> sqrt2.interval = [0,2];
% >> sqrt2.function = @(x) x^2-2;
% >> x = my_sovler(sqrt2)
% x =
%     1.4142
%
%

% checking the number of input and output arguments
narginchk(1,1)
nargoutchk(0,1)

% geting the paramters from the structure (for shorter names)
a = data.interval(1);
b = data.interval(2);
f = data.function;


% checking the condition f(a)f(b) < 0
interval = [a, b];
if sign(f(a)) == sign(f(b))
    error('The sign of the function should be different at the endpoints.')
end

% halving the interval and correcting one of the endpoints at each step
% until the length of the interval gets small enough 
while abs(b-a) > 10^-5
   c = (a+b)/2;
   if f(c) == 0
      break
   elseif sign(f(c)) == sign(f(a))
      a = c;
   else
      b = c;
   end
end

% estimating the solution as the center of the interval
x = (a+b)/2;

% optional output
switch nargout
    case 0
        fplot(f, interval)
        line('XData', interval, 'YData', [0, 0])
        text(...
            'String', num2str(c),...
            'Position', [c, 0],...
            'Color', [1, 0, 0],...
            'VerticalAlignment', 'bottom',...
            'Margin', 10);
        hold on
        plot(c, 0, 'ro')
    case 1
        varargout{1} = x;
end

end
%%
% [A, B] = parseLinearSystem(filename)
%
% Determining A and B matrices for the system of
% linear equations: A*x=B given in the form:
%
% A(1,1)*x + A(1,2)*y + ... + A(1,m)*z = B(1,1) B(1,2) ... B(1,M)
% A(2,1)*x + A(2,2)*y + ... + A(2,m)*z = B(2,1) B(2,2) ... B(2,M)
% ...
% A(n,1)*x + A(n,2)*y + ... + A(n,m)*z = B(n,1) B(n,2) ... B(n,M)
%
% where A(i,j), B(i,k) are real numbers.
%
%
% Remarks:
%
% - the name of a variable can be any valid Matlab variable name,
% - '*' is not necessary,
% - any number of spaces can be used
% - any number of consecutive '=' signs can be used: '==', '===', etc.
%
% 

function [A, B] = parseLinearSystem(filename) 

if ~isstr(filename)
    error('Invalid filename!')
    return
end

if ~(exist(filename)==2)
    error(['The file ', filename, ' does not exist!'])
    return
end

eqns = importdata(filename, '\n');
eqns = cellfun(@(x) [' ', x, ' '], eqns', 'UniformOutput', false);
vars = (symvar([eqns{:}]))';

n = length(eqns);
m = length(vars);

A = zeros(n,m);

for k = 1:n

    eqn = eqns{k};


    % determining the left- and right-hand side of the equation
    % by splitting at the equal sign: '='
    %
    % side.left - left-hand side of the equation
    % side.right - right-hand side if the equation
	
    side = cell2struct(strsplit(eqn, '='), {'left', 'right'}, 2);  
    
    % obtaining the right-hand side: side.right
    % str2num('12 3.4 -45')

    b = str2num(side.right);

    % checking the consistency of right-hand side
    % the right-hand sides must have the same number of columns (M)
    
    if ~(exist('M') == 1)
        M = length(b);
        B(k,1:M) = b;
    elseif exist('M') == 1 && length(b) == M
        B(k,1:M) = b;
    else
        error('The equations have inconsistent right-hand sides!');
    end

    % getting rid of spaces

    side.left = strrep(side.left, ' ', '');    

    % splitting by the variables

    [c, v] = strsplit(side.left, vars);

    % computing coefficients

    N = length(v);
    c = c(1:N);

    coeffs = zeros(1,N);
    for n = 1:N
        switch c{n}
            case {'+', ''} 
                c{n} = '1';
            case '-'
                c{n} = '-1';
            otherwise
            end
        coeffs(n) = str2num(strrep(c{n}, '*', ''));
    end

	% indicies of the current variables
	
    ind = cellfun(@(x) strfind(cell2mat(vars), x), v);
    
    % setting the values of A
    
    A(k,ind) = coeffs;
end

end
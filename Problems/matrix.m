%% Introduction to Matlab Programming
%
% Rudolf Csikja (csikja@math.bme.hu)
% 
% Mathematics Institute
% Budapest University of Technology and Economics
% 
%

%% Lists
clc;

% Lists are homogenius containers, i.e. they can only contain the same type
% of things, such as 
% Numbers: double, single, int8, int16, ...
% Booelan: logical
% String: char
%
% function_handle - NOT ALLOWED in lists

L1 = [-1, 2.3, 3, 4.5]  
L2 = [1 0 1 0]          

                        
%% List of characters (a.k.a String)
['H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd', '!']

%% ASCII code
% 8 bit = one character, 2^8=255 different characters
% for example: 0100|1010 = 0x4A = 74 = 'J'
%
% 
%
% ASCII code table :
% ----------------------------------------------
% 8: BACKSPACE
% 9: TAB
% 10: NEW LINE
% 13: CARRIEGE RETURN
% 27: ESCAPE
% 32: SPACE
% 33--47: !"#$%&'()*+,-./
% 48--57: 0123456789
% 58--64: :;<=>?@
% 65--90: ABCDEFGHIJKLMNOPQRSTUVWXYZ
% 91--96: [\]^_`
% 97--123: abcdefghijklmnopqrstuvwxyz
% 124--127: {|}~
% ----------------------------------------------
clc
disp('Learn more about <a href="http://en.wikipedia.org/wiki/ASCII">ASCII code</a>.')
char(74)        
uint8('J')        

% Now we finally understand this!
[97, 'b', 99, 100]

%%
clc
name = 'Sue'
age = 74;
disp([name, ' is ', age ,' years old.'])           % What???
disp([name, ' is ', num2str(age) ,' years old.'])  % convert to string: 25 -> '25'

%% Conversion between String and Number

str2num('12')
num2str(5)



%% Colon operator
clc
1:5        % a:b -> [a, a+1, a+2, ..., a+n], a+n <= b and a+n+1 > b
0:2:10     % a:d:b -> [a, a+d, a+2d, ..., a+nd]
3:-3       % empty list
3:-1:-3  

'a':'z'    % = char(97:123)
'#':'F'
'A':2:'Y'


%% Linear (equidistante) spacing
clc
linspace(0,1)
linspace(0, 1, 5)
linspace(0, -3, 5)

%% Concatenation
clc
['Hello', ' ', 'World!']      % we have already done this 
[1:3, 7:-1:5, 1000, 2000] 


%% List arithmetics
clc
x = [1, 2, 3]
y = [3, 2, 1]
x + y
1 + x
3*x
x.*y
x./y
x.^2
x.^y

%% Built-in functions work with lists too
clc
x = linspace(0,1,5)

sin(x)
exp(x)./(x.^2)*6

%% Other useful functions for lists
clc
clear
x = [1, 5, 4, 7, 12]

[length(x), min(x), max(x)]     % length, min, max
sort(x)
[list, index] = sort(x)         % shorted list and indices
[sum(x), prod(x)]               % sum and product
[cumsum(x), cumprod(x)]         % cummulative sum and product
dot(x, x)                       % scalar product

%% The arrafun function
% arrayfun(f, [a1, a2, ..., an]) -> [f(a1), f(a2), ..., f(a3)]
% f - function_handle
% f must return with a singleton value or without a value
clc
a = [1, 5, 7, 10]
b = [2, 7, 3, 1]
f = @(x) x^2;
g = @(x, y) x + y;

arrayfun(f, a)
arrayfun(@(x) x^2 - 5*x + 3, b)
arrayfun(g,a,b)

arrayfun(@(x) disp('apple'))

arrayfun(@(x) disp(['potato', num2str(x)]), 1:3)



%% Matrix
% Matrix ~ Table ~ Array ~ Tensor (~ List ~ Vector)
% All entry must be filled

clc
A = [1 2 3 4; 5 6 7 8]      % matrix of 2x4 size, 2 rows, 4 columns
%A = [1 2 3 4; 5 6]         % incorrect ('not rectangular')
                            % 
B = [1 2 3 4 5]             % A list is a 1xN matrix
C = [1; 2; 3]               % column vector

%% Size of a matrix
sie(A)
size(A,1)
size(B)
size(C)
length(A)
numel(A)
numel(B)

%% Logical functions
isrow(B)
iscolumn(C)
ismatrix(A)
isvector(B)
isscalar(A)
isempty([])

%% Special matrices
%
clc;

zeros(3)       
ones(5,2)      
eye(3)          % identity matrix
diag(1:3)       % diagonal mátrix
diag(1:3,1)     % off-diagonal
diag(1:3,-2)    % off-diagonal


%% Pattern replication
clc
repmat([1, 2, 3], [4, 2])
repmat([1, 2; 3, 4], [2, 5])
repmat('M A T L A B', [6,1])

%% Random matrices
%
clc
R = rand(3)
S = rand(2,5)
N = randn(5)
Q = randi(5,3)
T = randi([-5,10],[3, 8])


%% Magic square
%
clc;
magic(3)
sum(magic(3), 1)      % summing  rows
sum(magic(3), 2)      % summing columns

%% Pascal
pascal(5)

%% Addressing part of a matrix
%
clc
A = [11:15; 21:25; 31:35]

%% Continuous index
A(5)
A(1:8)
A([1 1 3 3 10 15 15])

%% Multi-index
clc
A
A(1,2)
A([1, 3], [2, 3, 5])

%% usgin 'end'
clc
A
A(end)            % last element (cont. index)
A(1:2:end-1)       
A(end-2:end)  

%% All elements from rows/columns
clc
A
A(1,:)
A(:,3)

%% Logical index
clc
X = magic(3)
Y = logical([1 0 1; 0 0 0; 1 0 1])
X(Y)

X>2 & X<6
X((X>2) & (X<6))
X(mod(X,3)==0)


x = randi(30,1,10)
x(x>13 & x<25)

%% Example
n = 20;
clc
E = [...
    randi([1, 3], n, 1),...     % group number
    randi([0, 1], n, 1),...     % received treatment - 1, not rec. tre. - 0
    randi([14, 54], n, 1),...   % age
    40 + 100*rand(n, 1)]        % weight

% average age
mean(E(:,3))

% weights of group 2
E(E(:,1)==2,4)

% how many subjects recieved treatment under the age of 30?
clc
sum(E(E(:,2)==1, 3)<30)

% what percentage the subject above 80kg
% who recieved treatment was in group 1?
above80 = E(E(:,4) > 80,:);
100*sum(above80(:,2) == 1 & above80(:,1)==1)/size(above80, 1) 



%% Overwriting/deleting part of a matrix
clear
clc
A(1,5) = 50     % the undefined entries will be filled with zeros

A(4,7) = 88     % growing size (should be avoided!)


A([4], [3, 5]) = 300;
A([2, 3, 4], [1, 2, 4]) = magic(3)

%%
A(1,:) = []             % deleting the first row
A(:, (end-2):end) = []  % deleting the last 3 columns

%% Example: delete/substitute NaN, Inf entries
clc
r = randi([0, 2], 1, 10);
q = randi([0, 2], 1, 10);
s = randi([0, 5], 1, 10);
x = s + 0./q + floor(1./r)

%%
x(~isnan(x))
x(~isinf(x))
x(~isinf(x)&~isnan(x))      % equvivalently x(~(isinf(x)|isnan(x)))

x(isnan(x)) = 10
x(isinf(x)) = []

%% Structural manipulation
clc
A = [11:15; 21:25; 31:35]
B = [11:14; 21:24; 31:34]
C = [11:15; 21:25]

A'                      % transpose
cat(2,A,B)              % concatenation
cat(1,A,C)
circshift(A,1)
circshift(A,[1, -1])    % cyclic shift

flipdim(B,2)            % flipping
rot90(A)                % 90 degree rotation
reshape(B,[2,6])        % reshaping

%% Matrix arithmetics
%
A = [1 2 3; 4 5 6]
B = [11 12; 21 22; 31 32]

2 + A
3 * A
A + B'
A.*B'
A ./ B'
A.^2
A.^(B'/10)

% Matrix * Matrix   (non-commutative!)

A*B
B*A

% Matrix power
% M^5 = M*M*M*M*M
[1 2; 3 4]^5

% Diadic product and scalar/dot product
% These are important cases of Matrix * Matrix product
u = 1:5
v = (-1:3)'

% Scalar product
u*v

% Diadic product
v*u


%% Linear system of equations

% the general forms: A*X = B or X*A = B
% find X
clc;

%% Invertable case
clc
A = [1, 1; -3, 1]
B = [6; 2]

x = inv(A)*B
x = A\B

% transposed equation
A = A'
B = B'

x = B*inv(A)
x = B/A


%% Underdetermined system
clc
A = [1 1 3; 2 2 4]
B = [1; 3]
% inversion does not work
% inv(A)

% nullvectors, solving the homogeneuos system
y = null(A)

A*y

% solving the equation
x = A\B

% checking the solutions
A*x
A*(x+15*y)


%% Overdetermined system
clc
A = [1 2; 1 4; 3 5]
B = [1; 3; -1]

x = inv(A'*A)*A'*B

x = A\B

% x does not satisfy the equation Ax=B, but this is the closest we get
A*x-B
norm(A*x-B)
norm(A*(x+[-0.01; 0.01])-B)


%% Explain the following result:
clc
[1, 2, 3] / [3, 4, 5]

A = [3, 4, 5]
B = [1, 2, 3]
A*A'
inv(A*A')
B*A'
x = inv(A*A')*B*A'

% this is the best solution
norm(x*A-B)
norm((x+0.01)*A-B)

% relative error
norm(x*A-B)/norm(B)

%% Application to regression

%% Linear regression
x = linspace(0,10)';
y = 0.76*x + 1.37 + 0.5*randn(1,100)';
scatter(x, y, '.r')
hold on


A = [x, ones(length(x), 1)];
B = y;

a = A\B;

plot(x, a(1)*x+a(2), 'b')

%% Quadratic regression
x = linspace(0,5)';
y = (x - 2.3).^2 + 1.37 + 0.5*randn(1,100)';
scatter(x, y, '.r')
hold on


A = [x.^2, x, ones(length(x), 1)];
B = y;

a = A\B

plot(x, a(1)*x.^2 + a(2)*x+a(3), 'LineWidth', 2)

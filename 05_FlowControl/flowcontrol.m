%% Introduction to Matlab Programming
%
% Rudolf Csikja (csikja@gmail.com)
% 
% Mathematics Institute
% Budapest University of Technology and Economics
% 
% Branches and loops
%

format compact


%% If/elseif/else
clc;
x = input('Give me a number: ');
n = num2str(x);
% simplest form
if x > 5
    disp([n, ' is bigger than 5.'])
end

if x < 0
    disp([n, ' is negative.'])
end

if true
    disp(repmat('*', 3, 20))
end

if false
    disp('This will never appear.')
end


%% the else branch
%
clc;
x = input('Give me a number: ');
n = num2str(x);
if x > 0
    str = [n, ' is positive.'];
else
    str = [n, ' is not positive.'];
end

disp(str)

%% the elseif branch
%
clc;
x = input('Give me a number: ');
n = num2str(x);
if x > 0
    str = [n, ' is positive.'];
elseif x < 0
    str = [n, ' is negative.'];
else
    str = [n, ' is zero.'];
end

disp(str)

%% multiple elseif branches
%
clc;
x = input('Give me a number: ');
n = num2str(x);

if (x > 0) && (x < 10)
    str = [n, ' is between zero and ten.'];
elseif x == 10
    str = [n, ' is ten.'];
elseif x > 10
    str = [n, ' is bigger than ten.'];
elseif x < 0
    str = [n, ' is negative.'];
else
    str = [n, ' is zero.'];
end

disp(str)

%% Switch
%
clc;
x = input('Give me a number: ');
n = num2str(x);
switch x
    case 2
        str = [n, ' is the smallest prime number.'];
    case x^2
        str = [n, ' is equal to its own sqare.'];
    case {3, 5, 7, 11}
        str = [n, ' is a prime number.'];
    otherwise
        str = ['I don''t know what ', n, ' is.'];
end
disp(str)

%% Switch with string
clc;
x = input('Give me a number: ', 's');
switch x
    case '2'
        str = [x, ' is the smallest prime number.'];
    case num2str(str2double(x)^2)
        str = [x, ' is equal to its own sqare.'];
    case {'3', '5', '7', 'three', 'five', 'seven'}
        str = [x, ' is a prime number.'];
    otherwise
        str = ['I don''t know what ', x, ' is.'];
end
disp(str)

%% Cannot switch to numeric array

state = [0, 0];

switch state
    case [0, 0]
        str = '[ ][ ]';
end

%% Use string instead
% but before you do, ask yourself if you really need to do this
clc
state = [0, 0];

%%
%state = [1, 2];
stateStr = num2str(state);
stateStr(stateStr == ' ') = [];

switch stateStr
    case '00'
        str = '[ ][ ]';
        state = [0, 1];
    case '01'
        str = '[ ][=]';
        state = [1, 0];
    case '10'
        str = '[=][ ]';
        state = [1, 1];
    case '11'
        str = '[=][=]';
        state = [0, 0];
    otherwise
        str = '[ERR]';
end

disp(str)


%% Emulating IF
clc;
x = input('Give me a number: ');
n = num2str(x);
switch x > 0
    case true
        str = [n, ' is positive.'];
    otherwise
        str = [n, ' is not positive.'];
end
disp(str)


%% A simple menu
clc;
menuItems = {'Random Matrix', 'Magic Square (5)', 'Plot'};
menuNumbers = num2cell(1:length(menuItems));
cellfun(@(item, k) disp([num2str(k), '. ', item]), menuItems, menuNumbers)

switch lower(input('Please select: ', 's'))
    case {'1', '1.', 'first'}
        clc
        n = input('How big that matrix should be? ');
        X = rand(n);
        clc
        if n > 5
            disp('Displaying only the top left 5x5 corner...')
            disp(X(1:5, 1:5))
        else
            disp(X)
        end
    case {'2', '2.', 'second'}
        clc
        disp(magic(5))
    case {'3', '3.', 'third'}                  
        fun = input('I can draw a function over [0,1]: ', 's');
        ezplot(fun, [0, 1])
    otherwise
        disp('Try again...')
end




%% Loops

%% for loop

%% doing something 10 times
clc
for k = 1:10
    disp('apple')
end

%%
for k = 1:10
    disp(['apple ', num2str(k)])
end

%% 
clc;
x = 0;
for n = 1:5
    x = x + 3;
    disp([n, x])
end


%%
clc
for n = [1, 2]
    for m = [2, 2, -3, 0]
        disp([n,m])
    end
end


%%
clc
for e = [
        1, 2, 3;
        3, 3, 1;
        0, 1, 2
        ]
    disp(e)
    disp(' ')
end

%%
clc
for c = {1:10, magic(3), 'Hello World!'}
    disp(c{1})
end

%%
clc
for d = {{1, 2}, {3, 2}, {5, 7}}
   disp([d{1}{1}, d{1}{2}])
end

%% Equivalent forms
x = randi(10, [1, 10]);

for k = 1:10
    disp(x(k))
end

for k = x
    disp(k)
end


%% Nested loops
clc
A = zeros(5,3);

for i = 1:5
    for j = 1:3
        A(i,j) = i*j;
    end
end

disp(A)

%% using matrix operations
(1:5)'*(1:3)

%% All pairs
clc
x = 1:5;
n = length(x);
y = zeros(n^2,2);
for j = 1:n
    for i = 1:n
        y(n*(j-1) + i,:) = x([j, i]);
    end
end
disp(y)

%% using matrix operations 
x = 1:5;
n = length(x);
x([reshape(repmat(1:n, n, 1), [], 1), repmat((1:n)', n, 1)])



%% While loop

clc;
clear n

n = 1;
while n <= 10
    disp([num2str(n), '. Hello'])
    n = n + 1;
end
disp('END')

%% if you hit enter it'll break the loop
n = 1;
while n ~= 0
    n = input('Give me a number: ');
    if n ~= 0
        disp('It''s not zero.')
    end
end
disp('it''s zero.')
%% because [] considered false
clc
while []
    disp('hello')
end

%% a better solution (?)
n = 1;
while (isempty(n) || n ~= 0 )
    n = input('Give me a number: ');
    if n ~= 0
        disp('It''s not zero.')
    end
end
disp('It''s zero.')


%% A simple menu (cont'd)
exitMenu = false;

while ~exitMenu
    clc;
    menuItems = {'Random Matrix', 'Magic Square (5)', 'Plot', 'Exit'};
    menuNumbers = num2cell(1:length(menuItems));
    cellfun(@(item, k) disp([num2str(k), '. ', item]), menuItems, menuNumbers)
    
    
    switch lower(input('Please select: ', 's'))
        case {'1', '1.', 'one', 'first'}
            clc
            n = input('How big that matrix should be? ');
            clc;
            X = rand(n);
            if n > 5
                disp('Displaying only the first 5x5 entries...')
                disp(X(1:5, 1:5))
            else
                disp(X)
            end
            pause
        case {'2', '2.', 'two', 'second'}
            clc
            X = magic(5);
            disp(X)
            pause
        case {'3', '3.', 'three', 'third'}
            fun = input('I can draw a function over [0,1]: ', 's');
            ezplot(fun, [0, 1])
        case {'4', '4.', 'four', 'fourth'}
            exitMenu = true;
        otherwise
            disp('Try again...')
            pause
    end
end

%% Break & continue

%%
clc;
n = 0;
while true
    n = n + 1;
    nStr = num2str(n);
    disp([nStr, '. PROG A'])
    if n > 5
        disp([nStr, '. STOP'])
        break
    elseif n > 3
        disp([nStr, '. START PROG A'])
        continue
    else
        disp([nStr, '. PROG B'])
    end
    disp([nStr, '. PROG C'])
end


%% infinite loop
% stop computation: CTRL + C
while true
    disp('MATLAB')        
end


%% Loops vs matrices
% 
clc
N = 10^6;
n = 1:N;
x = randi(10,[1,N]);

tic
sum(x)
toc

tic
s = 0;
for i = 1:N
    s = s + x(i);
end
toc
s

%% Hilbert matrix: H(i,j) = 1/(i+j-1)

%% with/without initialization
clc
clear H
N = 10^3;
n = 1:N;

% no initialization
tic
for i = n
    for j = n
        H(i,j) = 1/(i+j-1);
    end
end
toc

clear H
% proper initialization
H = zeros(N);
tic
for i = n
    for j = n
        H(i,j) = 1/(i+j-1);
    end
end
toc

%% matrix arithmetics
clear H
tic
H = 1./(ones(N,1)*n + n'*ones(1,N)-1);
toc

%% matrix arithmetics + auxulary variable
clear H
tic
A = ones(N,1)*n;
H = 1./(A + A' - 1);
toc
    
%% arrayfun
clear H
tic
H = arrayfun(@(i, j) 1/(i+j-1), A, A');
toc

%% built-in function
clear H
tic
H = hilb(N);
toc
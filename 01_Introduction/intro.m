% Introduction to Matlab Programming
%
% Rudolf Csikja (csikja@gmail.bme.hu)
% 
% Mathematics Institute
% Department of Mathematical Analysis
% Budapest University of Technology and Economics
% 
%
%

format compact  % a more compact display of the results
                % I prefer the compact format, especially for presentation

%% Basic arithmetic

1+2             % addition          a+b
3-5             % substraction      a-b
11*13           % multiplication    a*b
2/3             % division          a/b
2^3             % power             a^b


%% Trigonometric and other elementary functions
clc;
sin(0.1)        % sin(x)
cos(0.1)        % cos(x)
tan(0.1)        % tg(x)
asin(0.1)       % arcsin(x)
acos(0.1)       % arccos(x)
atan(0.1)       % arctg(x)

sqrt(2)         % square root, same as 2^(1/2)
round(1.2)      % rounding
sign(-2)        % signum
mod(13,5)       % reminder

exp(2)          % e^x
log(3)          % ln(x)
log10(2)        % lg(x)

%% Constants
pi              % 3.142...
Inf             % Infinity
NaN             % Not a Number
i               % i = (-1)^(1/2)

%% Complex numbers
clc;
1 + 3*i             % complex number: z = a + ib
(1 + 2*i)*(1+5*i)   % multiplication: z*w
(1 + 2*i)/(1+5*i)   % division: z/w
(1 + i)'            % conjugation: z'
real(1+i)           % real part: real(a+ib)=a
imag(1+i)           % imaginary part: imag(a+ib)=b
abs(1+i)            % length: abs(a+ib)=sqrt(a^2+b^2)
exp(i*pi)+1         % complex exponent (Euler-formula)

%% Integers
clc
clear
i64 = int64(1);     % integer 64 bit = 8 byte
i32 = int32(1);     % integer 32 bit = 4 byte
i16 = int16(1);     % integer 16 bit = 2 byte
i8 = int8(1);       % integer 8 bit = 1 byte
ui8 = uint8(1);     % unsigned integer 8 bit = 1 byte
whos

%% Overflow  
clc
intmax('int8')      % 2^8 diffrent numbers can be represented 
int8(2^7-1)         % 1 bit is for the sign, the other 7 for the actual number
int8(2^7)           % 'overflow' (this is the same number as 2^7-1)
int8(2^7+100)       % ditto

%% 'Reals'
% floating-point numbers (see IEEE754 Standard)
clc
clear
disp('Learn more about <a href="http://en.wikipedia.org/wiki/Floating_point">floating point</a>.')
disp(' ')
d = double(1);      % double 8 byte = 64 bit (default)
s = single(1);      % single 4 byte = 32 bit
whos

realmax
realmin

eps(d)              % relative accuracy
eps(s)              % relative accuracy



%% Display formats
clc
format short        % 4 digits (default)
pi
format long         % 15 digits (double), 7 digits (single)
pi
single(pi)

format shortE
pi/1000
format longE
pi/1000

format shortEng     % engineer notation (n, u, m, k, M, G, T)
pi*10^7
format longEng 
disp(pi*10^7)


format short
%%
clc
format loose
pi
pi
format compact
pi
pi

%% The concept and importance of variables
%
% Usually (but not always!) practical to use variables.
% The name of a variable can only contain the following characters:
% a..z, 0..9 and _ (underscore), the first letter must be a..z
% Give your variables meaningful and descreptive names.
% 
% These are correct names:
% position_x, posX, x, X1
% X_x_y_Y is technically correct but no one would ever use such name
% Here are some incorrect variable names
% (can you identify the problems?): 
% hu!, #12, 1x, 2x, 1_x, x_1?2.

% Naming convention:
% The most important thing is to be consistent!
% 
% snake_case:
% mouse_pos_x, mouse_pos_y  
% 
% camelCase:
% mousePositionX, mousePositionY
%

% Simple example
clc
clear           % clear variables Work Space
a = 1; b = 2;   % creating variables
who             % currently existing variables
c = a + b;      % a new variable
clear a         % clearing the varible 'a'
who            % 'a' is disappeared


%% Strings
clc
name = 'Sarah';
age = '27';
disp(name)
disp([name,'-', name, '-', name])
disp([name,' is ',        age ,' years old.'])

%% Conversion from number to string
% You cannot mix numbers and strings.
clc
age = 27;
disp([name, ' is ', age ,' years old.'])           % What???
disp([name, ' is ', num2str(age) ,' years old.'])  % convert to string: 25 -> '25'
                                
                                        
%% Reading the input as a string
clc
name = input('Add meg a neved: ','s');       % 's' for string input, that is
age = input('Add meg a korod: ','s');       
disp([name, ' is ', age, ' years old.'])

%% Example
% 
clc
x = input('Temperature (C): ');
disp([num2str(x), ' C = ', num2str(9*x/5+32), ' F'])


%% Logic

% Boolean variables only have two possible values:
% 0 - false
% 1 - true
%
% doc true
% doc false

clear
clc
a = 1;
b = logical(32);
c = false;
whos a b c

%% Boolean operations
%
clc
% not
% and
% or
% implication
% equivalence

a = logical([0; 0; 1; 1]);
b = logical([0; 1; 0; 1]);
disp(['Truth Table'])
disp([9,' a', '     b', '    ~b', '    a&b', '   a|b', '  a->b', '  a==b'])
disp('     ---------------------------------------')
disp([a, b, ~b, a & b, a | b, ~a | b, (~a & ~b) | (a & b)])

%% Boolean functions
clc
% relations
[2 == 3, 3 > 3, 2 <= 2]

%%
clc
% checking types
isinteger(1)    % Determine if input is integer array
isfloat(1.2)    % Determine if input is floating-point array
isnumeric('a')  % Determine if input is numeric array
isreal(1+i)     % Determine if array is real
isfinite(Inf)   % Array elements that are finite
isinf(-Inf)     % Array elements that are infinite
isnan(NaN)      % Array elements that are NaN

%% Function handle
clc
clear;
f = @sin                % f = @(x) sin(x)
g = @(x) 2*x
h = @(x,y) [x+y, x*y, x^y]
whos

% now you have your own functions

f(pi/2)
g(3)
h(3,5)


%% Example (higher order function)
% the 'apply' function takes a function (function_handle) F and a number x,
% and evaluates the function F at the given number x, and returns
% with the result F(x)
clc
apply = @(F, x) F(x);

f = @sin;
apply(f, pi/2)

apply(@cos, pi)

apply(@(z) z>5, 1)

apply(@(x) x^2, 3)




%% Introduction to Matlab Programming
%
% Rudolf Csikja (csikja@gmail.com)
% 
% Mathematics Institute
% Budapest University of Technology and Economics
% 
% Data
%



%% More about String
%
% here are some strings
s1 = 'apple';
s2 = 'grape';
s3 = 'orange';
s4 = 'lemon';


%% Logical function (checking string type)
ischar(s1)
ischar(12.3)

%% Comparing strings as equality of character arrays
% This is problematic
clc

'apple' == 'apple'
'apple' == 'orange'

%% Case sensitive and non case sensitive version
strcmp('apple', 'orange')
strcmp('cherry', 'Cherry')
strcmpi('cherry', 'Cherry')

%% Comparing only the first n characters
strncmp('apple', 'apple pie', 4)
strncmpi('apple', 'Apple pie', 4)

%% Some useful things
isspace
isletter
ischar
blanks



%% String categories
str = 'Monkey2 <-?';
isstrprop(str, 'alpha')
isstrprop(str, 'punct')
isstrprop(str, 'digit')


%% String join
clc
% these two are the same:
[s1, s2]         
strcat(s1, s2)   

% this makes a matrix (padding with blanks)
char(s1, s2, s3, s4)

%% Justify text
% Who's who by Benjamin Zephania 
%
clc
poem = char('I used to think nurses',...
             'Were women,',...
             'I used to think police',...
             'Were men,',...
             'I used to think poets',...
             'Were boring,',...
             'Until I became one of them.')
         
poem_r = strjust(poem, 'right')
poem_c = strjust(poem, 'center')

poem_c(2,:)
strtrim(poem_c(2,:))

%% Searching, replacing
clc

for j = 1:length(poem(:,1))
    [j, strfind(poem(j,:), 'used')]
end


%%
clc
s = [];
for j = 1:length(poem(:,1))
    s = char(s, strrep(poem(j,:), 'I', 'You'));
end
s(1,:)=[];
s

%% string as a Matlab expression
clc
x = 1;
y = 2;
eval('z=sin(x+y)')      % not recommended
z = eval('sin(x+y)')
whos z


%% Convert letter cases (upper case, lower case) 
upper(poem)
lower(poem)


%% Date and time
%

%% clock gives you the current time
% a vector [year, month, day, hour, min, sec]
clc
clock

%% print out date and time
clc
c = clock;
disp(...
    char(...
    ['date: ', num2str(c(1)), '.', num2str(c(2)), '.', num2str(c(3)), '.'],...
    ['time: '  num2str(c(4)), ':', num2str(c(5)), ':', num2str(round(c(6)))]...
    ))

%% 
clc
datestr(clock)
datestr([2011, 12, 10, 14, 23, 45])
date


%%
clc
datevec(date)
datenum(date)
calendar(2014, 10)

%% end of month day
eomday(1984, 1:12)
sum(ans)

%% adding dates
clc
addtodate(datenum(date), 100, 'day');
datestr(ans)
addtodate(now, 2, 'hour');
datestr(ans)

%% measuring elapsed time 
clc
tic
pause(1)
toc

pause(2)
et = toc

%% string formating
% different types of numbers
clc
sprintf('%d \n%f \n%e \n%E', 12, 12, 12, 12)

%% strings and numbers
clc
sprintf('%s = %d\n', 'A', 479, 'B', 352, 'C', 651)

%% or you can use fprintf to print the result:
fprintf('%s = %d\n', 'A', 479, 'B', 352, 'C', 651)


%% 
clc
sprintf('%c', 'MATLAB')
sprintf('%s', 'MATLAB')

sprintf('%c\t%s', 'MATLAB')
sprintf('%s\t%c', 'MATLAB')

sprintf('%c\t%c\t%s', 'MATLAB')


%%
clc
data = {...
    {'Everett Richardson', 34, 0.693},...
    {'Mona Duncan', 44, 0.009},...
    {'Kim Strickland', 37, 0.816},...
    {'Priscilla Silva', 35, 0.126},...
    {'Gregory Reyes', 40, 0.517}...
    };

for i = 1:length(data)
fprintf('%s is %d years old and his/her score: %.2f\n', data{i}{:})
end

%% print date and time
% 
clc
months = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'};
my_datestr = @(c) sprintf(...
    '%02d-%s-%d %02d:%02d:%02d',...
    c(3), months{c(2)}, c(1), c(4:5), round(c(6)));

my_datestr(clock)
datestr(clock)
%% continuous indexing
A1 = [9.9, 9900];
A2 = [8.8,  7.7 ; ...
      8800, 7700];
formatSpec = 'X is %4.2f meters or %8.3f mm\n';
sprintf(formatSpec, A1, A2)

%% Compare the results
clc
sprintf('%s %s %s', '1st', '2nd', '3rd')
sprintf('%3$s %2$s %1$s %2$s %1$s', '1st', '2nd', '3rd')

%%
%
clc
A = pi*100*ones(1,6);
sprintf(' %f \n %.2f \n %+.2f \n %12.2f \n %012.2f \n %-12.2f', A)

sprintf('%30s', 'empty SPACE')
sprintf('%-30s', 'empty SPACE')


%% varying formats
clc
fprintf('%*f\n%.*f\n%*.*f\n', ...
        15, 123.45678,...
        3, 123.45678,...
        12, 5, 123.45678)              
%%
% do not mix these

sprintf('%d %3$d %d %d', ...
        1, 2, 3, 4)
%%
% compare
clc
sprintf('%d', 1, 2, 3, 4)
sprintf('%1$d', 1, 2, 3, 4)

%%
% compare
clc
v = [1.4, 2.7, 3.1];

sprintf('%.4f, %.4f, %.4f', v)
sprintf('%3$.4f, %1$.4f, %2$.4f', v)

%% Link
site = 'http://www.google.com';
title = 'GOOGLE';

% use HTML syntax to make a link
fprintf('<a href = "%s">%s</a>\n',site,title)

%%
x = sscanf('10 20 30 hello 11 22 33 szia 100 200 300 hello', '%d %d %d %*s')


%% Reading from file
%% reading line by line: fgetl, fgets
clc
fid = fopen('poem.txt', 'r', 'n', 'UTF-8');

while ~feof(fid)
   disp(fgetl(fid))
end
fclose(fid);
clear fid

%% compare
clc
fid = fopen('poem.txt', 'r', 'n', 'UTF-8');

while ~feof(fid)
   disp(fgets(fid))
end
fclose(fid);
clear fid

%% feof
clc
clear
fid = fopen('poem.txt', 'r', 'n', 'UTF-8');
k = 0;
poem = blanks(100);
while ~feof(fid)
    c = fscanf(fid,'%c', 1);
    if ~isempty(c)
       k = k+1;
       poem(k) = c;
    end
end
    
fclose(fid);
clear fid;
whos 
disp(poem)


%% Writing into file
x = 0:.1:1;
A = [x; exp(x); sin(x)]'

%%
clc
fileID = fopen('exp.txt','w');
fprintf(fileID,'%6s %12s %12s\n', 'x','exp(x)', 'sin(x)');
fprintf(fileID,'%6.2f %12.8f %12.3f\n', A);
fclose(fileID);
type('exp.txt')

%% Append
clc
myformat = '%5d %5d %5d %5d\n';

fid = fopen('changing.txt','w');
fprintf(fid, myformat, magic(4));
fclose(fid);
clear fid

type changing.txt
%%
% open to append
fid = fopen('changing.txt','a');

% continue where at the end of the file
fprintf(fid, myformat, repmat([55 55 55 55], [5, 1]));
fclose(fid);
clear fid

type changing.txt

%% cell
clc
X = {{'pineapple', 12, 35}, {'banana', 46, 2}, {'raspberry', 87, 0}};

filename = 'cell_data.txt';
fid = fopen(filename, 'w');

for k=1:3
    fprintf(fid, '%15s: %d[%03d]\n', X{k}{:});
end

fclose(fid);
clear fid
type cell_data.txt

%% dlmread, dlmwrite

A = magic(10);
dlmwrite('dlm1.txt', A)
type dlm1.txt


%% delimiter must be one character
dlmwrite('dlm2.txt', 1./A, 'delimiter', '\t', 'precision', '%.3f')
type dlm2.txt

%% append by specific offset
dlmwrite('dlm2.txt', rand(5,10), '-append',...
    'roffset', 2, 'coffset', 3, 'delimiter', '|', 'precision', '%.4f')
type dlm2.txt

%%
% dlmread
%
% the simplest use
M1 = dlmread('dlm1.txt')

%% specific delimiter
M2 = dlmread('dlm2.txt', '|')

%% reading part of the file
M3 = dlmread('dlm2.txt', '|', 13, 7)

%%
M4 = dlmread('dlm2.txt', '|', [13, 7, 15, 10])

%% spreadsheet notation
M5 = dlmread('dlm1.txt', ',', 'B2..D6')


%% xlsread, xlswrite, xlsfinfo
%
doc xlsread


%% csvread, csvwrite
%
doc csvread

%% fileread
%
doc fileread

%% textread
%
doc textread

%% textscan
%
doc textscan

%% interacitve data reading
uiimport
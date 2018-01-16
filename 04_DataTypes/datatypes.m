%% Introduction to Matlab Programming
%
% Rudolf Csikja (csikja@math.bme.hu)
% 
% Mathematics Institute
% Budapest University of Technology and Economics
% 
% Data Types:
% Cells and Structures
%


format compact

%% Cell arrays
% Heterogeneous containers

a = {1, 2, 3}
b = {1, 2, 3; 4, 5, 6}
c = {magic(3), 1:10; 'Hello World!', {a, b}}

% empty cell (for initialization)
x = cell(2,3)


%% displaying cells (not so useful
clc
celldisp(a)
cellplot(c)


%% Indexing cell arrays

% It's very important to understand the difference
% X{} refers to the content
% X() refers to the handle of the content
X{3,5} = magic(3)
X(2,3) = {'Text'}
X(1:3,1:2) = {'Text', eye(4); {magic(5), 'magic'}, 12.4; 12, {11:11:55,@sin}}

%% Obtaining the cell's content 
clc
[a, b, c] = X{4:6}

clc
X{2, 2:3}

X(1,1:2)   

%% Continuous indexing
X{8}


%% Nested indexing
clc
X{3, 2}
X{3, 2}{2}
X{3,2}{2}(1)
X{1}(1:2:end)

%% But this is not allowed
X(1){1}


%% This is also important to understand
clc
X{2:3,1:2}

{X{2:3,1:2}}

%% The cell's contents can be used as arguments of a function
plot_option = {'LineWidth', 2, 'Color', [1, 0.5, 0]};
x = linspace(-5,5);
plot(x, exp(-x.^2), plot_option{:})

%% cellfun
clc

% The output is an array if it is possible
a = cellfun(@(x) x^2, {1, 2, 3, 4}) 


%%
% If array is not possible as an output the "UniformOutput', false"
% option must be used
clc
X = {[1, 2, 3], eye(3), -1, 'Hello World!'}
%b = cellfun(@(x) flipdim(x,2), X)
b = cellfun(@(x) flipdim(x,2), X, 'UniformOutput', false)  
b{1:4}

%% arrayfun can do the same
clc
Z = arrayfun(@(x,y) [x+y; x-y], 1:5, 11:2:20, 'UniformOutput', 0)
Z{1}
cell2mat(Z)

%%
Y = arrayfun(@(n) {eye(n), ones(n), zeros(n)}, 1:5, 'UniformOutput', 0)
Y{3}{1}
Y{4}{2}

%% Struct
%
clc
clear
Country.Name = 'Hungary';
Country.Population = 9.93;
Country.Area = 93028;
Country.Capital = 'Budapest';
Country.Member.UN = true;
Country.Member.EU = true;

%% some useful function related to cells
clc
fieldnames(Country)

getfield(Country, 'Name')
Country.Name

setfield(Country, 'Population', 9.96)
Country.Population = 9.93


orderfields(Country)

%% Structure arrays
clc
Country(2:8) = ...
          struct('Name', {'Austria', 'Slovakia', 'Ukraine', 'Romania', 'Serbia', 'Croatia', 'Slovenia'},...
                 'Population', {8.44, 5.49, 44.7, 21.3, 9.84, 4.38, 2.04},...
                 'Area', {83871, 49035, 603550, 238391, 77474, 56594, 20273},...
                 'Capital', {'Vienna', 'Bratislava', 'Kiev', 'Bucharest', 'Belgrade', 'Zagreb', 'Ljubljana'},...
                 'Member', cellfun(@(un, eu) struct('UN', un, 'EU', eu),...
                                                {true, true, true, true, true, true, true},...
                                                {true, true, false, true, false, true, true}));

%%                                            
Country(4).Remarks = {'The largest country.', 'hello'};
%% Dynamic indexing of structs
% 
% Struct.('FieldName'): () must be used!
clc
Country(1).('Name') 
s = 'Population';
Country(1).(s)
s = 'Capital';
Country(1).(s)

%% Using dynamical indexing
printData = @(field) arrayfun( @(n) disp(Country(n).(field)), 1:length(Country));
printData('Area')
printData('Name')

%% Examples
%% Collections
clc
{Country.Name}
whos ans
[Country(1:3).Area]
whos ans
[Country(1:3).Name]

%% Which country has population <5 million?

%{Country(Country.Population < 5).Name}      % Incorrect
{Country([Country.Population] < 5).Name}     % Correct

%% How many people lives in the 3 largest country (in total)?
[a, idx] = sort([Country.Area]);
sum([Country(idx(end-2:end)).Population])
{Country(idx(end-2:end)).Name}


%% Relative to the total population 
sum([Country(idx(end-2:end)).Population])/sum([Country.Population])

%% Which country has shorter name than its capital's name?
idy = arrayfun(@(n) length(Country(n).Name)<length(Country(n).Capital), 1:length(Country))
{Country(idy).Name}


{Country(cellfun(@length, {Country.Name}) < cellfun(@length, {Country.Capital})).Name}
%% Deleting a field
%
clc
X = rmfield(Country, {'Member', 'Remarks'});
X
Country




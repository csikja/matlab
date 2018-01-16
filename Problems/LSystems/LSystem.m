%% L-Systems
%  D0L-Systems (deterministic, context-free)
%
% 

%% Algae growth (fibbonacchi sequence)
% A -> AB
% B -> A
%
clear all
vars = 'AB';
rules = {'AB', 'A'};
clc
for k=0:6
    algae = unfoldLSystem(vars, rules, 'A', k);
    fprintf('%i:%i:%s\n', k, length(algae), displayAlgae(algae))
end


    
%% Cantor set
clc
clear all
vars = 'AB';
rules = {'ABA', 'BBB'};
for k=0:4
    s = unfoldLSystem(vars, rules, 'A', k);
    s(s == 'A') = '_';
    s(s == 'B') = ' ';
    disp(s)
end


%% Coch curve
vars = 'F';
axiom = 'F';
rules = {'F+F--F+F'};
angle = 60;
iterN = 5

s = unfoldLSystem(vars, rules, axiom, iterN)
drawLSystem(vars, angle, s)

%% Koch snowflake
vars = 'F';
axiom = 'F+F+F+F+F+F';
rules = {'F-F++F-F'};
angle = 60;
iterN = 4;

s = unfoldLSystem(vars, rules, axiom, iterN);
drawLSystem(vars, angle, s)

%% Variation on Koch curve
vars = 'F';
axiom = 'F';
rules = {'F-F+F+FF-F-F+F'};
angle = 90;
iterN = 5;

s = unfoldLSystem(vars, rules, axiom, iterN);
drawLSystem(vars, angle, s)


%% Dragon curve

vars = 'F';
axiom = 'F-F-F-F';
rules = {'F-FF--F-F'};
angle = 90;
iterN = 5;

s = unfoldLSystem(vars, rules, axiom, iterN);
drawLSystem(vars, angle, s)


%% Sierpinsky triangle
%

clc
vars = 'F';
axiom = 'F+F+F';
rules = {'F+F-F-F+F'};
angle = 120;
iterN = 5;

s = unfoldLSystem(vars, rules, axiom, iterN);
drawLSystem(vars, angle, s)


%% Dragon curve
%
clc
vars = 'XY';
axiom = 'X';
rules = {'X+Y+', '-X-Y'};
angle = 90;
iterN = 11;

s = unfoldLSystem(vars, rules, axiom, iterN);
drawLSystem(vars, angle, s)

%% Sierpinsky triangle

vars = 'AB';
rules = {'B+A+B', 'A-B-A'};
axiom = 'A';
angle = 60;
iterN = 5;

s = unfoldLSystem(vars, rules, axiom, iterN);
drawLSystem(vars, angle, s);


%% Space filling curve
vars = 'AB';
rules = {'A+B++B-A--AA-B+', '-A+BB++B+A--A-B'};
axiom = 'A';
angle = 60;
iterN = 4;

s = unfoldLSystem(vars, rules, axiom, iterN);
drawLSystem(vars, angle, s);

%% Binary tree
vars = 'XF';
rules = {'F[+F-X][-F+X]', 'FF'};
angle = 90;
str = unfoldLSystem(vars, rules, 'X', 4);
drawPlant(vars, angle, str)


%% Binary tree
vars = 'XF';
rules = {'F[+F-X][-F+X]', 'FF'};
angle = 45;
str = unfoldLSystem(vars, rules, 'X', 6);
drawPlant(vars, angle, str)

%% Ternary tree
vars = 'XF';
rules = {'F[+F-X][-F+X][X]', 'FFF'};
angle = 90;
str = unfoldLSystem(vars, rules, 'X', 4);
drawPlant(vars, angle, str)


%% Plant gowth

%% 
vars = 'F';
rules = {'F[+F]F[-F]F'};
angle = 25.7;
str = unfoldLSystem(vars, rules, 'F', 5);
drawPlant(vars, angle, str)

%%
vars = 'F';
rules = {'F[+F]F[-F][F]'};
angle = 20;
str = unfoldLSystem(vars, rules, 'F', 4);
drawPlant(vars, angle, str)

%%
vars = 'F';
rules = {'FF-[-F+F+F]+[+F-F-F]'};
angle = 22.5;
str = unfoldLSystem(vars, rules, 'F', 4);
drawPlant(vars, angle, str)

%%
vars = 'XF';
rules = {'F[+X]F[-X]+X', 'FF'};
angle = 20;
str = unfoldLSystem(vars, rules, 'X', 5);
drawPlant(vars, angle, str)

%%
vars = 'XF';
rules = {'F-[[X]+X]+F[+FX]-X', 'FF'};
angle = 22.5;
str = unfoldLSystem(vars, rules, 'X', 5);
drawPlant(vars, angle, str)

%%
vars = 'XF';
rules = {'F-[[X]+X]+F[+FX]-X', 'FF'};
angle = 22.5;
str = unfoldLSystem(vars, rules, 'X', 5);
drawPlant(vars, angle, str)


%% NEW APPROACH

clc

str = 'F[+F][-F]F'
x = cumsum((str == '[') - (str == ']')) - (str == '[');
str(x == 0)








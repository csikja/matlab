% Bevezetés a Matlab Programozásba
%
% Budapesti Mûszaki és Gazdaságtudományi Egyetem
% Matematika Intézet, Analízis Tanszék
%
% 2013
% -------------------
% Népszerûségi index
% -------------------
clc;
clear;


% Csúcsok
V = 1:6;
%V = 1:4;       % néhány teszt
%V = 1:5;
%V = 1:3;
n = length(V);

% Élek
E = [1 2; 1 4; 1 5; 1 6; 2 1; 2 3; 3 1; 3 2; 3 5; 4 5; 5 1; 6 1; 6 2; 6 4]';
%E = [1 3; 1 4; 2 4; 3 2; 4 1; 4 3]'
%E = [1 2; 1 4; 1 5; 2 1; 2 3; 2 4; 3 1; 4 3; 4 5; 5 1; 5 3]'
%E = [1 2; 2 1; 3 1]'

% A szomszédsági mátrix elõaállítása
A = arrayfun(@(i,j) any(E(2, E(1,:) == i) == j), ones(n,1)*(1:n), (ones(n,1)*(1:n))');

% A súlyozott szomszédsági mátrix, népszerûségi index
M = A./(ones(n,1)*sum(A));      % diadikus szorzat és elemnkénti osztás
u = abs(null(M-eye(n)))';       % az egyenletrendszer (pozitív) megoldása
z = u/max(u);                   % 

% Sorrend
[~, ix] = sort(u, 'descend');   % rendezés



% Kiírás
%
disp('Vertices: ')
disp(V)
disp(' ')

disp(['Edges: ', 10])
arrayfun(@(vi, vj) disp([8, num2str(vi), '->', num2str(vj),', ']), E(1,:), E(2,:))
disp([8, 8, 8, 13, ' '])

disp('Adjacency matrix:')
disp(A)
disp(' ')

disp('Relative popularity index:')
disp(z)
disp(' ')

disp('Ranking:')
disp(ix)

%% A gráf felrajzolása (ez így még sajnos irányítatlan)
% 
% Meg lehetne írni, hogy nyilak legyenek az egyenesek, de
% ezzel bizonyára könyebben oldható meg irányított gráf ábrázolása:
% https://code.google.com/p/graphviz4matlab/
%

n = length(V);
fi = pi*18/180;
th = fi + 2*pi*(0:(n-1))/n;
x = cos(th);
y = sin(th);

figure('MenuBar', 'figure',...
       'Color', [1, 1, 1],...
       'Name', ['A kapcsolati gráf'],...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', [300, 50, 500, 500])
gplot(A, [x', y']);
set(gca, 'Visible', 'off',...
     'DataAspectRatio', [1 1 1])
arrayfun(@(x,y) rectangle('Position', [x-0.2,y-0.2, 0.4, 0.4],...
                          'Curvature', [1, 1],...
                          'FaceColor', 'Blue'),...
         x, y)
arrayfun(@(xk, yk, vk, rank)...
    text('String', ['$', num2str(rank), ':v_', num2str(vk),'$'],...
    'Position', [xk, yk],...
    'Color', [1, 1, 1],...
    'FontSize', 11,...
    'HorizontalAlignment','center',...
    'Interpreter', 'latex'),...
         x, y, 1:n, ix)
% Bevezetés a Matlab Programozásba
%

format compact

%% 1. Feladat
%
clc;
disp('------------');
disp(' 1. Feladat');
disp('------------');
help tan
help atan2

atan(-1)*180/pi
atan2(-1,1)*180/pi
atan2(1,-1)*180/pi

%% 2. Feladat
%
clc;
disp('------------');
disp(' 2. Feladat ');
disp('------------');
% Az eredmény szerinti csoportosítás
% - - - - - - - - - - - - - - - - -
% véges érték (szám)
% 0/1, 0/Inf, 1^0, 0^1, 0^0, 0^Inf, Inf^0
disp([0/1, 0/Inf, 1^0, 0^1, 0^0, 0^Inf, Inf^0])

% Inf, -Inf
% 1/0, -1/0, Inf/0, Inf+Inf, Inf^Inf
disp([1/0, -1/0, Inf/0, Inf+Inf, Inf^Inf])

% NaN
% 0/0, Inf/Inf, Inf-Inf, 0*Inf, 1^Inf
disp([0/0, Inf/Inf, Inf-Inf, 0*Inf, 1^Inf])

%% 3. Feladat
%
%clc;
disp('------------');
disp(' 3. Feladat');
disp('------------');

x = 3;
y = 2;

a = (x^2-y^2)/(x^3*y);
b = sin(x+y) - sqrt(x-y);
c = x^y - y^x;
d = 4*pi*y^2;
e = exp(x) + exp(-x) - 2*cosh(x);
f = y + x^2*log(x+y);

disp([a b c d e f]')

%% 4. Feladat
%
% konverzió: mérföld -> kilométer
%
clc;
disp('------------');
disp(' 4. Feladat');
disp('------------');
mile2km = 1.60934;
x = input('Adja meg a távolságot mérföldben: ');
disp([num2str(x), ' mérföld = ', num2str(mile2km*x), ' km'])

%% 5. Feladat
%clc;
% 9 x 2pont
disp('------------');
disp(' 5. Feladat');
disp('------------');
x = 1:3;
y = [0 1 1];
list_a = 2*x;
list_b = x + 10;
list_c = x.^2;
list_d = x+y;
list_e = x-y;
list_f = x.*y;
list_g = y./x;
list_h = x.^x;
list_i = log(x);

disp(list_a)
disp(list_b)
disp(list_c)
disp(list_d)
disp(list_e)
disp(list_f)
disp(list_g)
disp(list_h)
disp(list_i)

%% 6. Feladat
% 10 x 2pont
%clc;
disp('------------');
disp(' 6. Feladat');
disp('------------');
list_a = 1:10;
list_b = 1:2:9;
list_c = linspace(-1,1,5);
list_d = (1:10).^2;
list_e = 10.^(-3:2);
list_f = 2.^(0:8);
list_g = 0:pi/3:2*pi;
list_h = (-1).^(0:9);
list_i = 'a':3:'z';
list_j = 'z':-1:'a';

disp(list_a)
disp(list_b)
disp(list_c)
disp(list_d)
disp(list_e)
disp(list_f)
disp(list_g)
disp(list_h)
disp(list_i)
disp(list_j)

%% 7. Feladat
%clc;
disp('------------');
disp(' 7. Feladat');
disp('------------');

n = 5;
fi = pi*18/180;
th = fi + 2*pi*(0:(n-1))/n;
x = cos(th);
y = sin(th);

figure('MenuBar', 'no',...
       'Color', [1, 1, 1],...
       'Name', ['Szabályos ', num2str(n),'-szög'],...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', [300, 50, 500, 500])

 axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])
 
 patch('XData', x, 'YData', y, 'FaceColor', 'none', 'EdgeColor', 'red')

%% 8. Feladat
clc;
n = 100;
pos_x = 10*rand([1, n]);
pos_y = 10*rand([1, n]);
d = rand([1, n]);

figure('MenuBar', 'no',...
       'Color', [1, 1, 1],...
       'Name', 'Véletlen körök',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', [300, 50, 500, 500])

 axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])
 arrayfun(@(x,y,d) rectangle('Position', [x-d/2, y-d/2, d, d],...
                             'Curvature', [1, 1]),...
          pos_x, pos_y, d)
      
%% 9. Feladat
% 6 x 3pont
%clc;clear;
disp('------------');
disp(' 9. Feladat ');
disp('------------');

x = [4, 5, 3, 7, 11, 2, 14, 9, 3, 11];
a = x(x>7);
b = x(x>3&x<=9);
c = x(mod(x,3)==0 | mod(x,7)==0);
d = x(mod(126,x)==0);
e = x(abs(circshift(x,[0, -1])-x)>=8);
f = x(x + circshift(x,[0, -2]) > circshift(x,[0, -1]));

disp(a);
disp(b);
disp(c);
disp(d);
disp(e);
disp(f);

%% 10. Feladat
% STOP

% making a new figure
figure('MenuBar', 'no',...
       'Color', [1, 1, 1],...
       'Name', 'STOP tábla',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', [300, 50, 250, 500])
   
% making a new axes
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1],...
     'XLim', [-1.5, 1.5],...
     'YLim', [-5, 1.3])

% a STOP tábáa szabályos hatszög alakú
% a szabályos hatszög pontjai
xs = cos(linspace(0,2*pi,7));
ys = sin(linspace(0,2*pi,7));

% a tábla szára
rectangle('Position', [-0.1 -5 0.2 3.95],...
          'FaceColor', [0.3, 0.3, 0.3],...
          'EdgeColor', [0.3, 0.3, 0.3]);

% a tábla teteje
% külsõ
patch('XData', 1.2*xs,...
      'YData', 1.2*ys,...
      'EdgeColor', [1, 0, 0],...
      'FaceColor', [1, 0, 0]);
% belsõ
patch('XData', xs,...
      'YData', ys,...
      'LineWidth', 5,...
      'EdgeColor', [1, 1, 1],...
      'FaceColor', [1, 0, 0]);

% felirat
text('String', 'S T O P',...
    'Position', [0, 0],...
     'FontSize', 20, ...
     'Color', [1, 1, 1], ...
     'FontName', 'Arial',...
     'FontWeight', 'Bold',...
     'HorizontalAlignment', 'center');

% mentés
saveas(gcf, 'stoptabla.eps', 'eps');
%%
%
%  OWL
% 

% ábra létrehozása
figure('MenuBar', 'figure',...
       'Color', [1, 1, 1],...
       'Name', 'Bagoly',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', [300, 50, 500, 500])
 
% a koordináta-rendszer beállítása
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1])

% színek:
% világos barna: [139, 90, 43]/255
barna_v = [139, 90, 43]/255;
% sötét barna: 
barna_s = [92, 51, 23]/255;
% narancs
narancs = [1 0.5 0];
% sárga
sarga = [1 1 0];

% bal láb
rectangle('Position', [-1.8, 1.3, 1, 1],...
          'Curvature', [1, 1],...
          'FaceColor', narancs,...
          'EdgeColor', 'none')
% jobb láb
rectangle('Position', [0.8, 1.3, 1, 1],...
          'Curvature', [1, 1],...
          'FaceColor', narancs,...
          'EdgeColor', 'none')
% test
rectangle('Position', [-3, 1.5, 6, 7.5],...
          'Curvature', [1, 1],...
          'FaceColor', barna_v,...
          'EdgeColor', 'none')
% has (fehér folt)
rectangle('Position', [-2, 1.6, 4, 4.9],...
          'Curvature', [1, 1],...
          'FaceColor', [1, 1, 1],...
          'EdgeColor', 'none')
% fej
patch('XData',[0, 2.5, -2.5],...
      'YData', [5, 9, 9],...
      'FaceColor', barna_s,...
      'EdgeColor', 'none')
% csõr
patch('XData',[0, 1, -1],...
      'YData', [5, 6.6, 6.6],...
      'FaceColor', narancs,...
      'EdgeColor', 'none')
% bal szem
rectangle('Position', [-1.8, 6.2, 1.6, 1.6],...
          'Curvature', [1, 1],...
          'FaceColor', sarga,...
          'EdgeColor', 'none')
% bal pupilla
rectangle('Position', [-1.3, 6.7, 0.6, 0.6],...
          'Curvature', [1, 1],...
          'FaceColor', [0, 0, 0],...
          'EdgeColor', 'none')
% jobb szem
rectangle('Position', [0.2, 6.2, 1.6, 1.6],...
          'Curvature', [1, 1],...
          'FaceColor', sarga,...
          'EdgeColor', 'none')
% jobb pupilla
rectangle('Position', [0.7, 6.7, 0.6, 0.6],...
          'Curvature', [1, 1],...
          'FaceColor', [0, 0, 0],...
          'EdgeColor', 'none')

      
%%
% mentés
saveas(gcf, 'bagoly.bmp', 'bmp');
saveas(gcf, 'bagoly.pdf', 'pdf');

%% 11. Feladat
% 9 x 3pont
%clc;clear;
disp('-------------');
disp(' 11. Feladat ');
disp('-------------');

sum_n = @(n) sum(1:n);
ssum_n = @(n) sum((1:n).^2);
fact = @(n) prod(1:n);
ffact = @(n) prod(n:-2:1); 
binom = @(n,k) prod((k+1):n)./prod(1:(n-k));
ln2 = @(n) sum(1./(1:n).*((-1).^(0:(n-1))));
nnum = @(p, r) prod(p.^r);
wmean = @(x,w) sum(w.*x)/sum(w);
solve_quad = @(a,b,c) [(-b + sqrt(b.^2 - 4*a.*c))./(2.*a); (-b - sqrt(b.^2 - 4*a.*c))./(2.*a)]' ;

sum_n(4)
ssum_n(4)
fact(4)
ffact(4)

binom(4,2)
ln2(10)
nnum([4, 2, 5], [1, -1, 2])
wmean([5, 4, 2], [5, 3, 2])
solve_quad(1,4,2)

%% 12. Feladat
% 7 x 3pont
%clc;clear;
disp('-------------');
disp(' 12. Feladat ');
disp('-------------');

first = @(x) x(1);
rest = @(x) x(2:end);
take = @(x,m) x(1:m);
drop = @(x,m) x((m+1):end);
riffle = @(x,a)...
    reshape([x;repmat(reshape(a,[length(a),1]),[1,length(x)])],[1,(length(a)+1)*length(x)]);
cumavr = @(x) cumsum(x)./(1:length(x));
movavr = @(x, m) arrayfun(@(k) sum(x(k:(k+m-1))), 1:(length(x)-m+1))/m;

a = 1:6;
first(a)
rest(a)
take(a,3)
drop(a,2)
riffle(1:3,[0 0])
riffle('HELLO WORLD!', '  ')
cumavr([1, 2, 6, 3, 18])
movavr([1, 2, 6, 3, 18], 3)

%% 13. Feladat
% 6 x 4pont
A = repmat(flipdim(eye(2), 2), 2, 3)
B = 2*diag(ones(1,4)) + 5*diag(ones(1,3),1) + 7*diag(ones(1,3),-1)
C = cat(2, cat(1, cat(2, cat(1, ones(2,3),4*ones(1, 3)), 2*ones(3, 2)), 5*ones(1, 5)), 3*ones(4,1))
D = (1:4)'*ones(1,4)
E = eye(5) | flipdim(eye(5),1)
F = reshape([1:5;zeros(1,5)],[10,1])

%% 14. Feladat

A = [5 1 4 9 1;
     6 0 4 3 0;
     3 8 1 0 0;
     4 4 6 8 7]

a = max(A')'
b = min(A)
c = sum(A)
d = sum((A.*(mod(A,2)==1))')'
e = A(:,1).*A(:,end)
f = A(:,2)*A(3,:)
g = sum(sum(A==0))
h = max(max(A))
i = sort(A(1:prod(size(A))));
i = i(end-2:end)
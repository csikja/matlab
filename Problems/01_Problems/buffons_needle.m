% Bevezetés a Matlab Programozásba
%
% Budapesti Mûszaki és Gazdaságtudományi Egyetem
% Matematika Intézet, Analízis Tanszék
%
% 2013
% -----------------------
% Buffon-féle tûprobléma
% -----------------------

clc
n = 10000;                  % a kísérletek száma
x = 6*rand(1,n);     % a túk x koordinátái: véletlen 0<x<6
y = 6*rand(1,n);     % a túk y koordinátái: véletlen 0<x<6
th = pi*rand(1,n);   % a túk szögei: véletlen 0<th<pi

figure('MenuBar', 'no',...                      % nem kell menü
       'Color', [1, 1, 1],...                   % fehér háttér
       'Name', 'Buffon féle tûprobléma',...     % az ablak neve
       'NumberTitle', 'off',...                 % nem kell az ablak számozása
       'NextPlot', 'add',...                    % új rajzot a régihez adjuk
       'Position', [100, 100, 500, 500])        % az ablak helyzete és mérete
   
axes('Visible', 'off',...                       % a tengelyek nem kellenek
     'DataAspectRatio', [1 1 1],...             % a képarány 1:1
     'XGrid', 'on',...                          % segédvonalak
     'YGrid', 'on',...
     'GridLineStyle', ':')

%
% a vízszintes vonalak felrajzolása
% 
% (-1,0) -- (7,0)
% (-1,2) -- (7,2)
% (-1,4) -- (7,4)
% (-1,6) -- (7,6)
%
% x koordináták mindig: [-1, 7]
% y koordináták: [y, y], ahol y = 0:2:6
%
%

drawHLine = @(y)...
    line('XData', [-1, 7], 'YData', [y, y], 'Color', 0.8*[1, 1, 1]);
arrayfun(drawHLine, 0:2:6)



%
% A tûk felrajzolása.
%
% Az (x,y) középpontú és th szögû tût az
% (x-0.5*cos(th), y-0.5*sin(th)) -- (x+0.5*cos(th), y+0.5*sin(th))
% egyenessel rajzoljuk meg.
%
% Az egyenes színe a kísérlet sikerességtõl függ (sikeres=1, siertelen=0);
% a színvektor elsõ  (RED) összetevõjét változtatjuk így fekete: [0, 0, 0]
% vagy piros: [1, 0, 0] lehet.
%

N = min([300, n]);                      % legfeljebb 300 tût rajzolunk ki
s = sin(th) >= 2*(1-abs(mod(y,2)-1));   % sikeres kísérletek: true (1)
                                        % sikertelen kísérletek: false (0)

drawNeedle = @(x, y, th, c) ...
    line(...
    'XData', x + 0.5*[-cos(th), cos(th)],...
    'YData', y + 0.5*[-sin(th), sin(th)],...
    'LineWidth', 2,...
    'Color', [c, 0, 0]);
arrayfun(drawNeedle, x(1:N), y(1:N), th(1:N), s(1:N));

% saveas(gcf, 'buffon_sim_1.eps', 'psc2')

% A sikeres kísérletek száma az összes kísérlet számához viszonyítva
relFreq = cumsum(s)./(1:n);

% Az ábra elõkészítése
figure('MenuBar', 'no',...
       'Color', [1, 1, 1],...
       'Name', 'Buffon féle tûprobléma',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', [650, 100, 500, 500])

% A relatív gyakoriság kirajzolása
plot(relFreq)
xlabel('Tûk száma: k')
ylabel('Relatiív gyakoriság: N(X_k)/k')

line('XData', [0, n], 'YData', [1, 1]/pi, 'Color', [1, 0.5, 0])
set(gca,...
     'XGrid', 'on',...
     'YGrid', 'on',...
     'GridLineStyle', ':',...
     'YLim', [0,0.5]);

% saveas(gcf, 'buffon_sim_2.eps', 'psc2')


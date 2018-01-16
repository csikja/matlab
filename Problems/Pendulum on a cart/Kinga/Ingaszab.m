clc
close all
screen = get(0, 'ScreenSize');
screen(1:2) = [];
figPos = [1*screen(1)/10, 0.8*screen(2)/4,8*screen(1)/10, 3*screen(2)/4];
figure(1)
set(1,...
    'Position', figPos,...
    'MenuBar', 'no',...
    'Color', [1 1 1],...
    'Name', 'Pendulum',...
    'NumberTitle', 'off')
axes(...
    'Box', 'on',...
    'DataAspectRatio', [1, 1, 1],...
    'XLim', [0,20],...
    'YLim', [0, 10])
line('XData', [0, 20],...
     'YData', [0.9, 0.9],...
     'Color', [0.1, 0.1, 0.1],...
     'LineWidth', 6)
 x0=5;
 fi0=10/180*pi;
 m=0.4;
 M=0.6;
%  b=0.3;
 b=100;
 g=9.81;
 J=0.008;
 l=0.14;
 s = tf('s');
 q = (M+m)*(J+m*l^2)-(m*l)^2;
 sim('ingaszabsim')
fps = 25;
dt = 1/fps;
t_end = 10;
t = linspace(0,1,floor(t_end*fps));
method = 'spline';
%axes(...
%    'Box', 'on',...
%    'DataAspectRatio', [1, 1, 1],...
%    'XLim', [0,20],...
%    'YLim', [0, 10])

for i = 1:length(t);
    line('XData', [0, 20],...
     'YData', [0.9, 0.9],...
     'Color', [0.1, 0.1, 0.1],...
     'LineWidth', 6)
DrawIng(3,elmozd.Data(i),elford.Data(i)*180/pi)

pause(dt)
end
  
%       %simulation parameters
% add_param('inga2s', 'b', '0.3');
% add_param('inga2s', 'Length', '0.14')
% add_param('inga2s', 'initPos', '0')
% add_param('inga2s', 'initVel', '0')
% add_param('inga2s', 'm', '0.4')
% add_param('inga2s', 'M', '0.6')
%     %simulation
% set_param('inga2s', 'FrictionCoefficient', num2str(frc));
% set_param('inga2s', 'Length', num2str(len))
% set_param('inga2s', 'initPos', '0')
% set_param('inga2s', 'initVel', '0')
% set_param('inga2s', 'm', '0')
% set_param('inga2s', 'M', '0')

    
      
 sim('inga2s.slx')
%% Irtech HF 1. Feladat
%�tviteli f�ggv�ny er�/elfordul�s
P_pend = (m*l*s/q)/(s^3 + (b*(J + m*l^2))*s^2/q - ((M + m)*m*g*l)*s/q - b*m*g*l/q);
% p�lusok meghat�roz�sa
poles = pole(P_pend)
T=1./poles
%rlocus(P_pend);
%title('Root Locus of Plant (under Proportional Control)')

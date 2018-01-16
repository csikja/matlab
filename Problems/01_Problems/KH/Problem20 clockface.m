clear all
clc

disp('Please enter a time in hours and minutes:')
input_h = floor(input('hours: '));
input_min = input('minutes: ');
% Due to the sind and cosd functions, a mod function for 12h
% is automatically included. 
% Minute values above 60 are not cut but accounted for in hours.


% ********** CLOCKFACE **********
rectangle ('Position', [-1,-1,2,2],...
            'Curvature', [0.9,0.9],...
            'EdgeColor', [0.25,0.3,0.5],...
            'LineWidth', 10,...
            'FaceColor', [0.5,0.55,0.7])
rectangle ('Position', [-0.6,-0.6,1.2,1.2],...
            'Curvature', [0.9,0.9],...
            'EdgeColor', [0.25,0.3,0.5],...
            'LineWidth', 10,...
            'FaceColor', [1,1,1])
axis ('equal',...
    [-1.1, 1.1, -1.1, 1.1]);
hold on;

% ********** INCREMENTS **********
incr = @(ang,incr_pos,incr_length,incr_width,col)rectangle(...
            'Position', [incr_pos*sind(ang)-0.5*abs(abs(incr_length*sind(ang))+incr_width) , incr_pos*cosd(ang)-0.5*abs(abs(incr_length*cosd(ang))+incr_width) , abs(incr_length*sind(ang))+incr_width,abs(incr_length*cosd(ang))+incr_width],...
            'Curvature',[1,1],...
            'LineStyle','none',...
            'FaceColor', col);
% parameters:
% angle
% incr_pos: moving increments outward
% incr_length: stretching the longer side
% incr_width: width
% col: colour
min_incr = @(ang) incr(ang, 0.8,   0,  0.05, [0.4,0.2,0.2]);
maj_incr = @(ang) incr(ang, 0.8, 0.15, 0.08, [0.35,0.05,0.05]);
arrayfun(min_incr,0:30:360);
arrayfun(maj_incr,0:90:360);

% ********** HANDS **********
hand = @(ang,r1, r2, width, col) plot([r2*sind(ang),r1*sind(ang)],[r2*cosd(ang),r1*cosd(ang)],...
                 'Color', col,...
                 'LineWidth', width);
% r1: outer radius of hand
% r2: inner radius of hand (can be negative)
% width: line width of hand
% col: colour
big_hand = @(ang)   hand(ang, 0.8, -0.1,  5, [0.35,0.05,0.05]);
small_hand = @(ang) hand(ang, 0.5, -0.05, 8, [0.4 ,0.2 ,0.2 ]);

draw_hands = @(h, min) [small_hand(30*h+0.5*min),big_hand(6*min)];

draw_hands (input_h,input_min);
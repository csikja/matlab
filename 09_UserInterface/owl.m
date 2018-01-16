% Bagoly

% Egy FIGURE objektum létrehozása
figure('MenuBar', 'no',...
       'Color', [1, 1, 1],...
       'Name', 'Bagoly',...
       'NumberTitle', 'off',...
       'NextPlot', 'add',...
       'Position', [300, 50, 500, 500],...
       'WindowButtonMotionFcn', @eye_move)
axes('Visible', 'off',...
     'DataAspectRatio', [1 1 1],...,
     'XGrid', 'on',...
     'YGrid', 'on',...
     'GridLineStyle', ':')

% bal láb
rectangle('Position', [-1.8, 1.3, 1, 1],...
          'Curvature', [1, 1],...
          'FaceColor', [1, 0.5, 0])
% jobb láb
rectangle('Position', [0.8, 1.3, 1, 1],...
          'Curvature', [1, 1],...
          'FaceColor', [1, 0.5, 0])
% test
rectangle('Position', [-3, 1.5, 6, 7.5],...
          'Curvature', [1, 1],...
          'FaceColor', [139, 90, 43]/255)
% has
rectangle('Position', [-2, 1.6, 4, 4.9],...
          'Curvature', [1, 1],...
          'FaceColor', [1, 1, 1])
% fej
patch('XData',[0, 2.5, -2.5],...
      'YData', [5, 9, 9],...
      'FaceColor', [92, 51, 23]/255)
% csõr
patch('XData',[0, 1, -1],...
      'YData', [5, 6.6, 6.6],...
      'FaceColor', [1, 0.5, 0])
% bal szem
rectangle('Position', [-1.8, 6.2, 1.6, 1.6],...
          'Curvature', [1, 1],...
          'FaceColor', [1, 1, 0])
% bal pupilla
pupill_left = rectangle('Position', [-1.3, 6.7, 0.6, 0.6],...
          'Curvature', [1, 1],...
          'FaceColor', [0, 0, 0]);
% jobb szem
rectangle('Position', [0.2, 6.2, 1.6, 1.6],...
          'Curvature', [1, 1],...
          'FaceColor', [1, 1, 0])
% jobb pupilla
pupill_right = rectangle('Position', [0.7, 6.7, 0.6, 0.6],...
          'Curvature', [1, 1],...
          'FaceColor', [0, 0, 0]);
% Matlab szöveg
text('String', 'M A T L A B',...
     'FontName', 'Times',...
     'Position', [0, 4],...
     'HorizontalAlignment', 'center',...
     'FontSize', 20,...
     'Color',[0.8, 0.8, 0.8],...
     'ButtonDownFcn', @push_owl)
set(gca, 'UserData', [pupill_left, pupill_right]);



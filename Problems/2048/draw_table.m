function draw_table(X, handles)

set(gcf, 'UserData', X)

tile_colours = [
            0.8, 0.76, 0.71;
            0.93, 0.89, 0.85;
            0.93, 0.88, 0.78;
            0.95, 0.69, 0.47;
            0.96, 0.58, 0.39;
            0.96, 0.49, 0.37;
            0.96, 0.37, 0.23;
            0.93, 0.81, 0.45;
            0.93, 0.80, 0.38;
            0.93, 0.78, 0.31;
            0.93, 0.77, 0.25;
            0.93, 0.77, 0.25;
            0.93, 0.76, 0.18
          ];

      for i = 1:4
          for j = 1:4
              if X(i,j) == 2
                  c=[0.47, 0.43, 0.4];
              else
                  c=[1, 1, 1];
              end
              if X(i,j) ~= 0
                  s = num2str(X(i,j));
              else
                  s = '';
              end
              set(handles.rec(i,j), 'FaceColor', tile_colours(max(0,log2(X(i,j))+1)+1,:));
              set(handles.text(i,j),...
                  'String', s,...
                  'Color', c);
          end
      end

end
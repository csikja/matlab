scrS = get(0, 'ScreenSize');
scrS(1:2) = [];

figure(...
    'Position', [scrS/4, scrS/2],...
    'Color', [1, 1, 1],...
    'Menubar', 'no',...
    'NumberTitle', 'off')

a = axes(...
    'XLim', [0, 12],...
    'YLim', [0, 10],...
    'Visible', 'off',...
    'DataAspectRatio', [1, 1, 1]);

trafficLight([0 3])
trafficLight([5 0], 2.5, 3)




t1 = trafficLight([0.3, 2.3], 1.7, 3);
t2 = trafficLight([3.6, 1], 3, 2);
t3 = trafficLight([4.8, 7], 0.8, 5);
t4 = trafficLight([8.5, 3], 1.5, 1.5);
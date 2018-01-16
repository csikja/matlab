screen = get(0, 'ScreenSize')
screen(1:2) = []

figure('Position', [screen/3, screen/3])
figure('Position', [0, 2*screen(2)/3, screen/3])
figure('Position', [2*screen(1)/3, 0, screen/3])
figure('Position', [0, 0, screen/3])
figure('Position', [2*screen(1)/3, 2*screen(2)/3, screen/3])

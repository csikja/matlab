function PlotDragonCurve (cycles)

turn = [90,-90]; % 0 = left turn, 1 = right turn
turns =  [0,mod(cumsum(turn(DragonCurve(cycles)+1)),360)];

coord_x = [0,cumsum(cosd(turns))];
coord_y = [0,cumsum(sind(turns))];

figure()
plot(coord_x,coord_y);
axis('equal');
axis([min(coord_x)-1, max(coord_x)+1, min(coord_y)-1, max(coord_y)+1])

end
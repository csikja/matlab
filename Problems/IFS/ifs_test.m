%% Sierpinski triangle

%sierpinski.initial_shape = [0, 0, 1, 0, 1, 1, 0, 1]';
A=diag([1, 1])/2;
sierpinski.initial_shape = [0, 0, 1, 0, 0.5, sqrt(3)/2]';
sierpinski.transformation = {A,A,A};
sierpinski.dilation = {[0;0], [0.5;0], [0.25; 0.25*sqrt(3)]};
sierpinski.step = 7;

ifs(sierpinski)

%% Sierpinski carpet
A = diag([1, 1])/3;
carpet.initial_shape = [0, 0, 3, 0, 3, 3, 0, 3]';
carpet.transformation = {A,A,A,A,A,A,A,A};
carpet.dilation = {[0;0],[1;0],[2;0],[0;1],[2;1],[0;2],[1;2],[2;2]};
carpet.step = 4;

ifs(carpet)

%% Barnsley fern

fern.initial_shape = [0, 0, 1, 0, 1, 5, 0, 5]';
fern.transformation = {...
   [0, 0; 0, 0.16],...
   [0.85, 0.04; -0.04, 0.85],...
   [0.2, -0.26; 0.23, 0.22],...
   [-0.15, 0.28; 0.26, 0.24]...
   };
fern.dilation = {[0;0], [0;1.6], [0;0.6], [0;0.44]};
fern.step = 6;

ifs(fern, 'FaceColor', [0, 0.5, 0])

%% Dragon curve

dragon.initial_shape = ([0, -1, 20, -1, 20, 1, 0, 1]/20)';
rot = @(fi) [cos(fi), -sin(fi); sin(fi), cos(fi)];
dragon.transformation = {...
   rot(-pi/4)/sqrt(2),...
   rot(5*pi/4)/sqrt(2)};
dragon.dilation = {[0;0], [1;0]};
dragon.step = 10;

ifs(dragon, 'FaceColor', [0, 0, 0.6])
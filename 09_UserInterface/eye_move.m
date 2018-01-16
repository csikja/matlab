function eye_move(obj, evnt)
p = get(gca, 'UserData');

x = get(gca, 'CurrentPoint');
d1 = x(1,1:2) - [-1.3, 6.7];
d1 = [-1.3, 6.7] + 0.4*d1/norm(d1);
d2 = x(1,1:2) - [0.7, 6.7];
d2 = [0.7, 6.7] + 0.4*d2/norm(d2);

set(p(1), 'Position', [d1, 0.6, 0.6])
set(p(2), 'Position', [d2, 0.6, 0.6])
end

function q = evaluateRound(d, p, qq)
% d: az osztó lapjainak értéke
% p: a játékos lapjainak értéke
% qq: tét
%
% q: a játékos által nyert összeg

if d == p
    disp('Döntetlen.')
    pause;
    [dd, pp] = playRound;
    q = evaluateRound(dd, pp, 2*qq);
elseif p > 21 || d == -1 || (d <= 21 && p ~= -1 && d > p)
    q = -qq;
else
    q = qq;
end
end
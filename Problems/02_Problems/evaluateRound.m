function q = evaluateRound(d, p, qq)
% d: az oszt� lapjainak �rt�ke
% p: a j�t�kos lapjainak �rt�ke
% qq: t�t
%
% q: a j�t�kos �ltal nyert �sszeg

if d == p
    disp('D�ntetlen.')
    pause;
    [dd, pp] = playRound;
    q = evaluateRound(dd, pp, 2*qq);
elseif p > 21 || d == -1 || (d <= 21 && p ~= -1 && d > p)
    q = -qq;
else
    q = qq;
end
end
function orb = orbit(f, x0, n)

orb = zeros(1, n+1);
orb(1) = x0;

for i = 1:n
    orb(i+1) = f(orb(i));
end

end
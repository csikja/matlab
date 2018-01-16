function seq = collatz(n)

k = n;

seq = [k];

while  k ~= 1
    switch mod(k,2)
        case 0
            k = k/2;
        case 1
            k = 3*k+1;
    end
    seq(end+1) = k;
end
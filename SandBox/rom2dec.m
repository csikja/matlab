function d = rom2dec(r)


conversionRules(uint8('IVXLCDM')) = [1, 5, 10, 50, 100, 500, 1000]; 

d = conversionRules(uint8(upper(r)));

a = -sign([diff(d), -1]);
a(a == 0) = a(find(a == 0)+1);
a(a == 0) = a(find(a == 0)+1);
d = sum(d.*a);
end
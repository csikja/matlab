function str = LCode2str(vars, code)

symbols = [vars, '+-[]'];
str = blanks(length(code));

for i = 1:length(symbols)
    str(code == i) = symbols(i);
end

end
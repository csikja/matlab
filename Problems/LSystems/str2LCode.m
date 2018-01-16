function code = str2LCode(vars, str)

code = zeros(1, length(str));
symbols =  [vars, '+-[]'];

for i = 1:length(symbols)
    code(str == symbols(i)) = i;
end

end

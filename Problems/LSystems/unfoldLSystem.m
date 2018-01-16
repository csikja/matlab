function s = unfoldLSystem(vars, rules, axiom, n)

% changing representation from strings to numbers
% vars: A, B, C, .... -> 1, 2, 3, ...
% cons: '+-[]'
%

cons = '+-[]';
N = length(rules);

% adding rules for the constants: + -> +, [ -> [, etc.

for i=1:4
    rules{N+i} = cons(i);
end

% coding the rules
for j = 1:length(rules)
    rules{j} = str2LCode(vars, rules{j});
end

% and the axiom as well
s = str2LCode(vars, axiom);

% length of the strings the rules will produce
nr = cellfun(@length, rules);


% rewriting the axiom n times
for k = 1:n
    % initializing ss
    ss = zeros(1,sum(nr(s)));
    
    % the result's place
    nEnd = cumsum(nr(s));
    nStart = nEnd - nr(s) + 1;
    
    % apply the rules and fill in ss
    for i = 1:length(s);
        ss(nStart(i):nEnd(i)) = rules{s(i)};
    end
    
    % the new axiom is the result
    s = ss;
end

% convert the result back to a string
s = LCode2str(vars, s);
end
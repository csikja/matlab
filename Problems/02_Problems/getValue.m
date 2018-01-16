function val = getValue(deal)
ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'};
values = containers.Map(ranks, {2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 1011});
v = sum(cellfun(@(d) values(d{2}), deal));
n = round(v/1000);

val = v - [(n*1000):10:n*(1010)];
val = val(val>0);

if (length(deal)==2) && (length(val) == 2) && (all(val == [21 11]))
    val = -1;
else
    [~, idx] = min([min(val(val>21)) max(val(val<=21))]);
    val = val(idx);
end
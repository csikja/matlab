function drawTable(deal, dealer, player)

clc

if getValue(deal(dealer)) == -1
    disp(['Osztó: ', 'BJ'])
else
    disp(['Osztó: ', num2str(getValue(deal(dealer)))])
end

drawCards(deal(dealer))
disp(' ')

if getValue(deal(player)) == -1
    disp(['Játékos: ', 'BJ'])
else
    disp(['Játékos: ', num2str(getValue(deal(player)))])
end
drawCards(deal(player))

disp(' ')

end
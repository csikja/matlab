function drawTable(deal, dealer, player)

clc

if getValue(deal(dealer)) == -1
    disp(['Oszt�: ', 'BJ'])
else
    disp(['Oszt�: ', num2str(getValue(deal(dealer)))])
end

drawCards(deal(dealer))
disp(' ')

if getValue(deal(player)) == -1
    disp(['J�t�kos: ', 'BJ'])
else
    disp(['J�t�kos: ', num2str(getValue(deal(player)))])
end
drawCards(deal(player))

disp(' ')

end
function game_new = change_player(game)

game_new = game;
exit_menu = false;

while ~exit_menu
    clc
    for i = 1:length(game.player)
        disp([num2str(i), ' ', game.player(i).name])
    end
    n = input('Choose player:');
    if n <= length(game.player) && n >= 1
        game_new.cp = n;
        exit_menu = true;
    end
end

end


%%

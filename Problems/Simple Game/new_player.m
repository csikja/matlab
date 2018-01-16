function game_new = new_player(game)

clc
game_new = game;
game_new.player(end+1).name = input('New Player: ', 's');

end
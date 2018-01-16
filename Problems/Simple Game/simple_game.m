% this is a simple quessing game
%

% checking wether the player variable or file exists

game.player(1).name = 'Jupiter';
game.player(1).time = [];
game.player(2).name = 'Saturn';
game.player(2).time = [];
game.player(3).name = 'Mars';
game.player(3).time = [];
game.cp = 1;                        % current player

%%
clc
% menu creation and input

menu = {'Start', 'Change Player', 'New Player', 'Ranking Board', 'Quit'};
exit_menu = false;

while ~exit_menu
clc
disp(['Current Player: ', game.player(game.cp).name])
hl = repmat('*',1,length(game.player(game.cp).name) +16);
disp(hl)
for i = 1 : length(menu)
 disp([num2str(i), '. ', menu{i}])
end
disp(hl)

    menu_chosen = input('Select a menu item: ');
    % branching
    switch menu_chosen
        case 1
            game = start_game(game);
        case 2
            game = change_player(game);
        case 3
            game = new_player(game);
        case 4
            view_ranking(game)
            pause
        case 5
            exit_menu = true;
            clc
    end
end

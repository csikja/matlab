function game_new = start_game(game)

cp = game.cp;
name = game.player(cp).name;
x = randi([1, 100]);
exit_guess = false;
         

% the best time of current player
% it can be an empty list, in this case
% there is no best time (it's inf).

best_time = min([inf,game.player(cp).time]);

% starting the game

clc

disp(['Hello ', name, '!'])
disp(repmat('*',1, length(name)+ 7))
tic
while ~exit_guess
   guess = input('Guess: ');
   if guess>100 || guess<1
       disp('The number is in the range 1..100')
   elseif guess > x
       disp('Your guess is too large.')
   elseif guess < x
       disp('Your guess is too small.')
   else
       exit_guess = true;
       t = round(10*toc)/10;
       disp(['You have guessed the number in ', num2str(t), ' seconds.'])
       if best_time > t
           disp('This is your personal best!')
       end
   end
end


game_new = game;
game_new.player(cp).time(end+1) = t;
pause()

end
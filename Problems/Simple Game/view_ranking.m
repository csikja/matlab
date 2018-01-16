function view_ranking(game)

clc
n = length(game.player);
m = min([5, sum(cellfun(@length, {game.player(:).time}))]);
ranking = cell(1,m);
best_time = inf*ones(1,n);
time_idx = zeros(1,n);
for k = 1:m
    for i = 1:n
        [a, b] = min(game.player(i).time);
        if isempty(a)
            best_time(i) = Inf;
        else
            best_time(i) = a;
            time_idx(i) = b;
        end
    end
    [best_t, player_idx] = min(best_time);
    ranking{k} = {game.player(player_idx).name, best_t};
    game.player(player_idx).time(time_idx(player_idx)) = [];
end

disp('Ranking')
disp(repmat('*',1,20))
for i = 1:length(ranking)
    disp([num2str(i), '. ', ranking{i}{1}, ' (', num2str(ranking{i}{2}), ' sec)'])
end
disp(repmat('*',1,20))
end
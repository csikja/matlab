%
% A francia kártya  megadott lapjai rajzolja ki
% 
% drawCard({{suit1, rank1}, {suit2, rank2}, ...})    Kirajzolja a suit színû rank értékû
% kártyalapot. A lehetséges értékek:
%
% suit - 'Club', 'Diamond', 'Heart', 'Spade'
% rank - '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'
%
%
% Példa
%
% drawCards({'Spade', 'A'})
%

function drawCards(s)

if ~iscell(s{1})
    disp(drawCard(s))
else
    disp(cell2mat(cellfun(@drawCard, s, 'UniformOutput', false)));
end

end


function card = drawCard(s)

suit = s{1};
rank = s{2};

club = ...
[' --------- ';
 '|   ###   |';
 '|   ###   |';
 '| ####### |';
 '| ####### |';
 '| ## # ## |';
 '|    #    |';
 '|   ###   |';
 ' --------- '];

diamond = ...
[' --------- ';
 '|    #    |';
 '|   ###   |';
 '|  #####  |';
 '| ####### |';
 '|  #####  |';
 '|   ###   |';
 '|    #    |';
 ' --------- '];

heart = ...
[' --------- ';
 '|         |';   
 '|  #   #  |';
 '| ### ### |';
 '| ####### |';
 '|  #####  |';
 '|   ###   |';
 '|    #    |';
 ' --------- '];

spade = ...
[' --------- ';
 '|    #    |';   
 '|   ###   |';
 '|  #####  |';
 '| ####### |';
 '| ## # ## |';
 '|    #    |';
 '|   ###   |';
 ' --------- '];

% most ráírjuk az értékét
% a 10 két karakter hosszú, úgyhogy ettõl függõen kell lecserélni a kártya
% sarkaiban lévõ karaktereket

suits = containers.Map({'Club', 'Diamond', 'Heart', 'Spade'},...
                       {club, diamond, heart, spade});
card = reshape(suits(suit), [9, 11]);

n = length(rank);
card(2,2:(n+1)) = rank;
card(2,(end-n):(end-1)) = rank;
card(end-1,2:(n+1)) = rank;
card(end-1,(end-n):(end-1)) = rank;

end
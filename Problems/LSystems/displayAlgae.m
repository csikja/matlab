% Display algee
% displayAlgae('AABABBBAAABAABABBABABAA')
% A -> (OO)
% B -> (O)
function algae = displayAlgae(str)

    idx = zeros(1, length(str));
    idx(str == 'A') = 4;
    idx(str == 'B') = 3;
    idxEnd = cumsum(idx);
    idxStart = idxEnd - idx + 1;
    
    algae = blanks(4*sum(str == 'A') + 3*sum(str == 'B'));
  
    for i = 1:length(str)
        switch str(i)
            case 'A'
                algae(idxStart(i):idxEnd(i)) = '(OO)';
            case 'B'
                algae(idxStart(i):idxEnd(i)) = '(O)';
        end
    end
end
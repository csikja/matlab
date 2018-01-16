% This function copies the file filename1 to filename2
% 
%

function CopyFile(filename1, filename2)
try
    fid1 = fopen(filename1, 'r');
        if fid1 == -1
            disp(sprintf('Cannot open ''%s''!', filename1));
        elseif exist(filename2, 'file')
            disp(sprintf('The file ''%s'' already exists!', filename2));
            s = input('Please choose (cancel/overwrite/append):', 's');
            switch s
                case {'c', 'cancel', '1'}
                    return;
                case {'a', 'append', '3'}
                    fid2 = fopen(filename2, 'a');
                case {'o', 'owerwrite', '2'}
                    fid2 = fopen(filename2, 'w');
                otherwise
                    disp('The file will be overwritten!');
            end
        else
            fid2 = fopen(filename2, 'w');
        end 
    
        if fid2 == -1
                fprintf('Cannot open ''%s''!', filename2);
        end
    while ~feof(fid1)
        c = fscanf(fid1, '%c');
        fprintf(fid2, '%c', c);
    end
    fclose(fid1);
    fclose(fid2);
catch
disp('Something went wrong...')
end
function cipher_text(file_name_1, file_name_2, n)
try
    fid1 = fopen(file_name_1, 'r');
    if fid1 == -1
        fprintf('Cannot open ''%s''!\n', file_name_1);
    elseif exist(file_name_2, 'file')
        fprintf('The file ''%s'' already exists!\n', file_name_2);
    end
    fid2 = fopen(file_name_2, 'w');
    if fid2 == -1
        fprintf('Cannot open ''%s''!\n', file_name_2);
    end
    while ~feof(fid1)
        c = uint8(fscanf(fid1, '%c', 1));
        if ~isempty(c) && c >= 65 && c <= 90 
           c = mod(c + n - 65, 26) + 65;
        elseif ~isempty(c) && c >= 97 && c <= 122
             c = mod(c + n - 97, 26) + 97;
        elseif ~isempty(c) && c >= 33 && c <= 64
             c = mod(c + n - 33, 32) + 33;
        end
        fprintf(fid2, '%c', char(c));
    end
    akls
    fclose(fid1);
    fclose(fid2);
catch msg
    fprintf('%s\n', msg.message)
end
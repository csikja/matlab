function MergeFiles(filename, varargin)
try
    fidf = fopen(filename, 'a');
     if fidf == -1
            disp(sprintf('Cannot open ''%s''!', filename));
            return;
     end
     
     if nargin == 1
         return
     else
         fid(nargin-1) = 0;
     end
     
     fid = cellfun(@(x) fopen(x, 'r'), varargin);
     
     if any(fid == -1)
         disp('Cannot open files!');
         return;
     end
     
     for k = 1:(nargin-1)
         while ~feof(fid(k))
             c = fscanf(fid(k), '%c');
             fprintf(fidf, '%c', c);
         end
         fprintf(fidf, '\n');
     end
     fclose all;
catch
    disp('Something went wrong...')
    fclose all;
end
end
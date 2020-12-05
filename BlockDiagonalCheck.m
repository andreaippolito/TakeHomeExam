function [Answer] = BlockDiagonalCheck(matrix)
%WARNING This only works for matrices where the 0's are symmetric 
n = size(matrix);
blocksize = 1;
ii = 1;
while ii <= blocksize
    for jj=1:n
        if matrix(ii,jj) ~= 0;
            blocksize = max(jj, blocksize);
        end
    end
    ii = ii+1;
end
if blocksize < n;
    Answer = 1;
else
    Answer = 0;
end


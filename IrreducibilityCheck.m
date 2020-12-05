function [Answer] = IrreducibilityCheck(matrix)
%WARNING This only works for matrices where the 0's are symmetric 
n = size(matrix);
Answer = 0;

for ii=1:n
    v(ii) = ii;
end

permutations = perms(v);
sizes = size(permutations);
for ii=1:sizes(1)
    P = zeros(3,3);
    for jj=1:n
        P(permutations(ii,jj),jj) = 1;
    end
    test = P*matrix*P';
    if BlockDiagonalCheck(test) == 1;
        Answer = 1;
    end
end
end


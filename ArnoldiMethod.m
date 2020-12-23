function [v, h] = ArnoldiMethod(v, numberOfIterations, methodMatrix, problemMatrix)
%ARNOLDIMETHOD Summary of this function goes here
%   Detailed explanation goes here
for jj= 1:numberOfIterations
   
    v(:,1+jj) = methodMatrix*(problemMatrix*v(:,jj));
    for ii= 1:jj
        h(ii,jj) = transpose(v(:,1+jj))*v(:,ii);
        v(:,1+jj) = v(:,1+jj) - h(ii,jj)*v(:,ii);
    end
    h(1+jj,jj) = norm(v(:,1+jj));
    v(:,1+jj) = v(:,1+jj)/h(1+jj,jj);
end
end




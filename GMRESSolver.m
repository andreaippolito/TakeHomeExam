function [residualNorms, numberOfIterations] = GMRESSolver(problemMatrix ,knownTerm, tolerance, initialGuess)
%JACOBIMETHODSOLVER This function uses the jacobi method to solve stuff
n = size(problemMatrix);
n = n(1);
methodMatrix=inv(diag(diag(problemMatrix)));

residual(1:n,1) = methodMatrix*knownTerm - methodMatrix*(problemMatrix*initialGuess);

v(1:n,1) = residual(1:n,1) / norm(residual(1:n,1));

numberOfIterations = n-1; %This can be changed

for jj= 1:numberOfIterations
    v(1:n,1+jj) = methodMatrix*(problemMatrix*v(1:n,jj));
    for ii= 1:jj
        h(ii,jj) = transpose(v(1:n,1+jj))*v(1:n,ii);
        v(1:n,1+jj) = v(1:n,1+jj) - h(ii,jj)*v(1:n,ii);
    end
    h(1+jj,jj) = norm(v(1:n,1+jj));
    v(1:n,1+jj) = v(1:n,1+jj)/h(1+jj,jj);
end

residualNorms = 1;
numberOfIterations = 1;

%Now minimize norm(residual(1:n,1) - methodMatrix*(problemMatrix*z)) where
%z is in the span of the columns of v. How do we do this? z = v*alpha?
%When we have that, do uk = initialGuess + v*y
end
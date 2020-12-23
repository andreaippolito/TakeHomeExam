function [residualNorms, numberOfIterations] = JacobiMethodSolver(problemMatrix ,knownTerm, tolerance, initialGuess)
%FORWARDGAUSSSEIDELSOLVER This function uses the gauss seidel method to solve stuff
methodMatrix=triu(problemMatrix) * inv(diag(diag(problemMatrix))) * tril(problemMatrix); %M_fgs = (D-F)D^-1(D-E) 
iterationMatrix=eye(size(problemMatrix))-methodMatrix^-1*problemMatrix;
[residualNorms, numberOfIterations] = IterativeFunction( iterationMatrix, methodMatrix, knownTerm, tolerance, initialGuess, problemMatrix);

end


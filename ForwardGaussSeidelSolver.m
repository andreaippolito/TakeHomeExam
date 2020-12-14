function [residualNorms, numberOfIterations] = ForwardGaussSeidelSolver(problemMatrix ,knownTerm, tolerance, initialGuess)
%FORWARDGAUSSSEIDELSOLVER This function uses the gauss seidel method to solve stuff
methodMatrix=tril(problemMatrix); %M_fgs = D-E 
methodMatrix=methodMatrix^-1;
iterationMatrix=eye(size(problemMatrix))-methodMatrix*problemMatrix;
[residualNorms, numberOfIterations] = IterativeFunction( iterationMatrix, methodMatrix, knownTerm, tolerance, initialGuess, problemMatrix);

end


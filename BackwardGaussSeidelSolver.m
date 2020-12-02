function [residualNorms, numberOfIterations] = BackwardGaussSeidelSolver(problemMatrix ,knownTerm, tolerance, initialGuess)
%BACKWARDGAUSSSEIDELSOLVER This function uses the gauss seidel method to solve stuff
methodMatrix=triu(problemMatrix); %M_bgs = D-F  
iterationMatrix=eye(size(problemMatrix))-methodMatrix^-1*problemMatrix;
[residualNorms, numberOfIterations] = IterativeFunction( iterationMatrix, methodMatrix, knownTerm, tolerance, initialGuess, problemMatrix);

end


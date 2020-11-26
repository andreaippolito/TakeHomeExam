function [residualNorms, numberOfIterations] = JacobiMethodSolver(problemMatrix ,knownTerm, tolerance, initialGuess)
%JACOBIMETHODSOLVER This function uses the jacobi method to solve stuff
methodMatrix=diag(diag(problemMatrix));
iterationMatrix=eye(size(problemMatrix))-methodMatrix^-1*problemMatrix;
[residualNorms, numberOfIterations] = IterativeFunction( iterationMatrix, methodMatrix, knownTerm, tolerance, initialGuess, problemMatrix);

end


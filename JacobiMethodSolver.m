function [residualNorms, numberOfIterations] = JacobiMethodSolver(problemMatrix ,knownTerm, tolerance, initialGuess)
%JACOBIMETHODSOLVER This function uses the jacobi method to solve stuff
methodMatrix=diag(1/problemMatrix(1,1));
iterationMatrix=eye(size(problemMatrix))-methodMatrix*problemMatrix;
[residualNorms, numberOfIterations] = IterativeFunction( iterationMatrix, methodMatrix, knownTerm, tolerance, initialGuess, problemMatrix);

end


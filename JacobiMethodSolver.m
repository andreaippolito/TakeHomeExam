function [residualNorms, numberOfIterations] = JacobiMethodSolver(problemMatrix ,knownTerm, tolerance, initialGuess)
%JACOBIMETHODSOLVER Summary of this function goes here
%   Detailed explanation goes here
methodMatrix=diag(diag(A));
iterationMatrix=eye(size(A))-methodMatrix^-1*problemMatrix;
[residualNorms, numberOfIterations] = IterativeFunction( iterationMatrix, methodMatrix, knownTerm, tolerance, initialGuess, problemMatrix);

end


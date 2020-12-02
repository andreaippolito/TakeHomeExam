function [residualNorms, numberOfIterations] = IterativeFunction(iterationMatrix, methodMatrix ,knownTerm, tolerance, initialGuess, problemMatrix) %#ok<*INUSL>
%ITERATIVEFUNCTION Summary of this function goes here
%   Detailed explanation goes here
problemDimension=size(iterationMatrix);
previousResidual=knownTerm-problemMatrix*initialGuess;
previousIteration=initialGuess;
nextIteration=previousIteration+methodMatrix*previousResidual;
nextResidual=ResidualCalculator(problemMatrix, methodMatrix, previousResidual);
numberOfIterations=1;
residualNorms(1)=max(abs(previousResidual));
residualNorms(2)=max(abs(nextResidual));
%residualNorms(1)=previousResidual;
%residualNorms(2)=nextResidual;

lastResidualNorm=max(abs(nextResidual));
while(lastResidualNorm/max(abs(knownTerm))>tolerance)
   previousIteration=nextIteration;
   previousResidual=nextResidual;
   nextIteration=previousIteration+methodMatrix*previousResidual;
   nextResidual=ResidualCalculator(problemMatrix, methodMatrix, previousResidual); 
   numberOfIterations=numberOfIterations+1;
   lastResidualNorm=max(abs(nextResidual));
   %residualNorms(numberOfIterations+1)=lastResidualNorm;
   residualNorms(numberOfIterations+1)=lastResidualNorm;
end
end
    

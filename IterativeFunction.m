function [residualNorms, numberOfIterations] = IterativeFunction(iterationMatrix, methodMatrix ,knownTerm, tolerance, initialGuess, problemMatrix) %#ok<*INUSL>
%ITERATIVEFUNCTION Summary of this function goes here
%   Detailed explanation goes here
methodMatrix=methodMatrix^-1;
problemDimension=size(iterationMatrix);
U=zeros(problemDimension(1),5);
previousResidual=f-problemMatrix*intialGuess;
previousIteration=initialGuess;
nextIteration=previousIteration+methodMatrix*previousResidual;
nextResidual=ResidualCalculator(problemMatrix, methodMatrix, previousResidual);
numberOfIterations=1;
residualNorms(1)=previousResidual;
residualNorms(2)=nextResidual;
lastResidualNorm=max(abs(nextResidual));
while(lastResidualNorm/max(abs(knownTerm))>tolerance)
   previousIteration=nextIteration;
   previousResidual=nextResidual;
   nextIteration=previousIteration+methodMatrix*previousResidual;
   nextResidual=ResidualCalculator(problemMatrix, methodMatrix, previousResidual); 
   numberOfIterations=numberOfIterations+1;
   lastResidualNorm=max(abs(nextResidual));
   residualNorms(numberOfIterations+1)=lastResidualNorm;
end
end
    

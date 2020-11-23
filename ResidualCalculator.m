function [nextResidual] = ResidualCalculator(problemMatrix, methodMatrix, previousResidual)
%RESIDUALCALCULATOR 
%   note that methodMatrix should be already the inverse Matrix
nextResidual=(eye(size(problemMatrix))-problemMatrix*methodMatrix)*previousResidual;
end


function [problemMatrix, knownTerm] = ProblemGenerator(N,  epsilon)
%UNTITLED Summary of this function goes here
h=1/N;
problemMatrix = diag((2*epsilon/h^2+1/h)*ones(1,N-1)) + diag((-epsilon/h^2)*ones(1,N-2),1) + diag((-epsilon/h^2-1/h)*ones(1,N-2),-1);
knownTerm = zeros(N-1,1);
knownTerm(1)=(epsilon/h^2+1/h);
end


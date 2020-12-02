tolerance=10^-6;
for ii= 4 : 9
    N=2^ii;
    initialGuess=zeros(N-1, 1);
    [problemMatrix, knownTerm]=ProblemGenerator(N, 0.5);
    [residualNorms, numberOfIterations]=JacobiMethodSolver(problemMatrix ,knownTerm, tolerance, initialGuess);
    %fplot( log(residualNorms/max(abs(knownTerm))), [1,numberOfIterations]);
   %
  %  for k=max(2,numberOfIterations-2):numberOfIterations+1
 %       fplot(residualNorms(k)/residualNorms(k-1), [max(1, numberOfIterations-3), numberOfIterations+1]);
   % end
    hold on
end
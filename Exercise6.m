tolerance=10^-6;
tolerance=10^-6;
epsilon=1;

for ii= 4 : 8
    while epsilon>10^-3
    N=2^ii;
    initialGuess=zeros(N-1, 1);
    [problemMatrix, knownTerm]=ProblemGenerator(N, 0.5);
    [residualNorms, numberOfIterations]=JacobiMethodSolver(problemMatrix ,knownTerm, tolerance, initialGuess);
    red=log(residualNorms/max(abs(knownTerm)));
    
    for k=max(2,numberOfIterations-2):numberOfIterations+1
        residualNorms(k)/residualNorms(k-1);
    end
    epsilon=epsilon/2;
    end
plot( linspace(1,numberOfIterations+1,numberOfIterations+1), red);
epsilon=1;
hold on;
end
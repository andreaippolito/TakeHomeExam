tolerance=10^-6;
epsilon=1;

for ii= 4 : 4
    %while epsilon>10^-3
    while epsilon>0.004
    N=2^ii;
    initialGuess=zeros(N-1, 1);
    [problemMatrix, knownTerm]=ProblemGenerator(N, epsilon);
    [residualNorms, numberOfIterations]=ForwardGaussSeidelSolver(problemMatrix ,knownTerm, tolerance, initialGuess);
    %red=log(residualNorms/max(abs(knownTerm)));
    red=residualNorms/max(abs(knownTerm));

    %for k=max(2,numberOfIterations-2):numberOfIterations+1;
    %    residualNorms(k)/residualNorms(k-1);
    %end
    epsilon=epsilon/2;
    semilogy ( linspace(1,numberOfIterations+1,numberOfIterations+1), red, 'DisplayName', string(epsilon));
    lgd = legend;
    hold on
    end    

lgd.NumColumns = 2;

epsilon=1;
figure;
end
tolerance=10^-6;
epsilon=1;
mVariable = [5,8]'; %INSERT M VALUES HERE

for ii= 4 : 5
    for jj=1:size(mVariable)
        N=2^ii;
        initialGuess=zeros(N-1, 1);
        residual = 1;
        trueResidualNorms = [];
        trueNumberOfIterations = 0;
        while norm(residual)/norm(knownTerm)>tolerance
            [problemMatrix, knownTerm]=ProblemGenerator(N, epsilon);
            [residualNorms, numberOfIterations, nextIteration, residual]=RestartedGMRESSolver(problemMatrix ,knownTerm, tolerance, initialGuess, mVariable(jj));
            initialGuess = nextIteration;
            trueResidualNorms = [trueResidualNorms, residualNorms];
            trueNumberOfIterations = trueNumberOfIterations + numberOfIterations;
        end
        red=trueResidualNorms/max(abs(knownTerm));
        semilogy ( linspace(1,trueNumberOfIterations,trueNumberOfIterations), red, 'DisplayName', string(epsilon));
        lgd = legend(append('m = ', string(mVariable)));
        hold on
    end
lgd.NumColumns = 2;
figure;
end
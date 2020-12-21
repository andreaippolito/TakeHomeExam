epsilon= 1/2;
N = 50;
[problemMatrix, knownTerm]=ProblemGenerator(N, epsilon);
methodMatrix=diag(1/problemMatrix(1,1));
iterationMatrix=eye(size(problemMatrix))-methodMatrix*problemMatrix;
eigValues = eig(iterationMatrix);

scatter(eigValues, zeros(1,N-1), '*')
hold on;

axis([-1, 1, -1, 1])

xlabel('R')
ylabel('i','Rotation',0)
title(append('N = ', string(N)))

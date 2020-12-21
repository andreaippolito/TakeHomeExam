epsilon= 1/2;
N = 50;
[problemMatrix, knownTerm]=ProblemGenerator(N, epsilon);
methodMatrix=diag(1/problemMatrix(1,1));
iterationMatrix=eye(size(problemMatrix))-methodMatrix*problemMatrix;
eigValues = eig(iterationMatrix);

%Option 1

scatter(eigValues, zeros(1,N-1), '*')
hold on;

radius = (max(eigValues)-min(eigValues)) / 2
center = [(max(eigValues)+min(eigValues)) / 2,0]
angle = 0:pi/100:2*pi;
xValue = radius * cos(angle) + center(1);
yValue = radius * sin(angle) + center(2);
plot(xValue, yValue);
scatter(center(1), center(2), 10, 'red', 'filled');

axis([-1, 1, -1, 1])
xlabel('R')
ylabel('i','Rotation',0)
title(append('N = ', string(N)))
hold off;
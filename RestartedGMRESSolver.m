function [residualNorms, numberOfIterations, nextIteration, residual] = RestartedGMRESSolver(problemMatrix ,knownTerm, tolerance, initialGuess, restartParameter)
%JACOBIMETHODSOLVER This function uses the jacobi method to solve stuff
n = size(problemMatrix);
n = n(1);
methodMatrix=inv(diag(diag(problemMatrix)));

residual(1:n,1) = methodMatrix*knownTerm - methodMatrix*(problemMatrix*initialGuess);

previousV = residual ./ norm(residual);

numberOfIterations = 1;
residualNorms(numberOfIterations)=( max(abs(residual)));

[nextV, h]=ArnoldiMethod(previousV, numberOfIterations, methodMatrix, problemMatrix);
beta=norm(residual);
[omegaMatrix, rMatrixTilde ]=qr(h);
omegaMatrix=omegaMatrix';

nextIteration = initialGuess; %Not entirely sure why this is necessary

while(norm(residual)/norm(knownTerm)>tolerance && numberOfIterations < restartParameter)
dimensionVector=[1; zeros(numberOfIterations,1)];
gTilde=beta*omegaMatrix*dimensionVector;

dimension=size(rMatrixTilde);
rMatrix=rMatrixTilde(1:dimension(1)-1, :);
g=gTilde(1:dimension(1)-1);

y=inv(rMatrix)*g;
nextIteration=initialGuess+previousV*y;

numberOfIterations=numberOfIterations+1;
previousV=nextV;
[nextV, h]=ArnoldiMethod(previousV, numberOfIterations, methodMatrix, problemMatrix);
n=size(omegaMatrix);
n=n(1);
temp=zeros(n,1);
transformMatrix=[omegaMatrix, temp; temp', 1];
expandedRMatrix=transformMatrix*h;
n=size(rMatrix);
sigma=expandedRMatrix(n(1)+2,n(2)+1);
rho=expandedRMatrix(n(1)+1, n(2)+1);
omegaMatrix=GivensRotation(rho, sigma, numberOfIterations-1)*[omegaMatrix, temp; temp', 1]; 
rMatrixTilde=omegaMatrix*h;
residual=knownTerm-problemMatrix*nextIteration;
residualNorms(numberOfIterations)=max(abs(residual));
end
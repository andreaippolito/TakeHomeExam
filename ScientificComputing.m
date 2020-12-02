%Parameters
N = 3;
epsilon = 1/2;
h = 1/N;

%Initializing matrices
A = zeros(N-1);
D = zeros(N-1);
E = zeros(N-1);
F = zeros(N-1);
%Creating elements 1,1 and 1,2
A(1,1) = 2*epsilon/h^2 + 1/h;
D(1,1) = A(1,1);
A(1,2) = -epsilon/h^2;
F(1,2) = -A(1,2);
%Creating elements 2,1 to N-2,N-1.
for ii=2:N-2
    A(ii,ii-1) = -epsilon/h^2 - 1/h; 
    E(ii,ii-1) = -A(ii,ii-1);
    A(ii,ii) = 2*epsilon/h^2 + 1/h;
    D(ii,ii) = A(ii,ii);
    A(ii,ii+1) = -epsilon/h^2;
    F(ii,ii+1) = -A(ii,ii+1);
end
%Creating elements N-1,N-2 and N-1,N-1
A(N-1,N-2) = -epsilon/h^2 - 1/h; 
E(N-1,N-2) = -A(N-1,N-2);
A(N-1,N-1) = 2*epsilon/h^2 + 1/h;
D(N-1,N-1) = A(N-1,N-1);

%Reference solution (remove the percentage to plot)
u_ref = @(x) (exp(x/epsilon) - exp(1/epsilon)) / (1 - exp(1/epsilon));
%fplot(u_ref, [0,1]);
%hold on

%Jacobi matrix
B_jac = eye(N-1) - inv(D)*A;

%Eigenvalues
e_jac = eig(B_jac);

%Spectral radius
e_max_jac = max(abs(e_jac));

%right hand side
f = zeros(N-1, 1);
f(1) = epsilon/h^2 + 1/h;

u = A\f;
%plot(h:h:1-h, u)

%test1
%disp(A)
%disp('D = ')
%disp(D)
%disp('E = ')
%disp(E)
%disp('F = ')
%disp(F)

%test2
%if (A == D-E-F)
%    disp('Correct')
%end

[problemMatrix, knownTerm] = ProblemGenerator(N, h, epsilon);
initialGuess = zeros(N-1,1);
tolerance = 10^-6;
[residualNorms, numberOfIterations] = JacobiMethodSolver(problemMatrix ,knownTerm, tolerance, initialGuess);
[residualNorms, numberOfIterations] = ForwardGaussSeidelSolver(problemMatrix ,knownTerm, tolerance, initialGuess);
[residualNorms, numberOfIterations] = BackwardGaussSeidelSolver(problemMatrix ,knownTerm, tolerance, initialGuess);
[residualNorms, numberOfIterations] = SymmetricGaussSeidelSolver(problemMatrix ,knownTerm, tolerance, initialGuess);




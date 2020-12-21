epsilon=[1,1/2,1/10,1/100]
N = 5;

for ii= 1 : 4
    u_ref = @(x) (exp(x/epsilon(ii)) - exp(1/epsilon(ii))) / (1 - exp(1/epsilon(ii)));
    fplot(u_ref, [0,1]);
    hold on;

    h = 1/N;
    [problemMatrix, knownTerm]=ProblemGenerator(N, epsilon(ii));
    solution1 = problemMatrix\knownTerm;
    solution2 = zeros(1,N);
    solution2(1) = 1;
    solution2(2:N) = solution1(1:N-1);
    solution2(N+1) = 0;
    plot(0:h:1,solution2)
end

xlabel('x')
ylabel('y','Rotation',0)
title(append('N = ', string(N)))
lgd = legend(append('Exact \epsilon = ', string(epsilon(1))), append('Numerical \epsilon = ', string(epsilon(1))), append('Exact \epsilon = ', string(epsilon(2))), append('Numerical \epsilon = ', string(epsilon(2))), append('Exact \epsilon = ', string(epsilon(3))), append('Numerical \epsilon = ', string(epsilon(3))), append('Exact \epsilon = ', string(epsilon(4))), append('Numerical \epsilon = ', string(epsilon(4))), 'Location','southwest');
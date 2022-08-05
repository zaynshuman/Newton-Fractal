
% Produces results for the absolute error and rate of
% convergence of the secant method
% NB: the functions Newton, derivFree, errorAnalysis must be
% in the current folder

rootsPolynomial = roots([1,0,0,0,0,-1]);

% We chose to use the same starting values as in A2, for a
% fair comparison of our results

[errorComparison1, logComparison1] = errorAnalysis(@(z) ... 
    z^5-1,@(z) 5*z^4, -50-75j, 35, rootsPolynomial(2));
[errorComparison2, logComparison2] = errorAnalysis(@(z) ...
    z^5-1,@(z) 5*z^4, 35+105j, 35, rootsPolynomial(3));
[errorComparison3, logComparison3] = errorAnalysis(@(z) ... 
    z^5-1,@(z) 5*z^4, 100, 35, rootsPolynomial(5));

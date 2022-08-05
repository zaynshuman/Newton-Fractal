
% Plots the convergence of Newton's method using a
% semi-log plot for three initial values
% NB: The functions newtonAnalysis and Newton must be in the
% current folder

rootsPolynomial = roots([1,0,0,0,0,-1]);

% Displays the semi-log plots for each of the initial values
% on seperate figures 

% 25 iterations will be run for each of the initial
% values, this has been specifically chosen since any more
% iterations in each of these cases would lead to
% catastophic cancellation errors since MATLAB is limited to
% an accuracy of 16 S.F.

N = 25;

figure()
[semilogPlot1, errorArray1] = newtonAnalysis(@(z) (z^5-1),...
 @(z) (5*z^4), - 50 - 75j, N, rootsPolynomial(2));

figure()
[semilogPlot2, errorArray2] = newtonAnalysis(@(z) (z^5-1),...
 @(z) (5*z^4), 35 + 105j, N, rootsPolynomial(3));

figure()
[semilogPlot3, errorArray3] = newtonAnalysis(@(z) (z^5-1),...
 @(z) (5*z^4), 100 + 0j, N, rootsPolynomial(5));


% Function for the comparison of absolute error and
% rate of convergence between the secant method and Newton's
% method

function [errorComparison, logComparison] ... 
    = errorAnalysis(f, df, z0, N, knownRoot)
% Inputs:
% f is a function and df its derivative
% z0 is the initial data (complex)
% N is the number of iterations of the secant method 
% knownRoot is the root that we expect to converge towards

% Return values: 
% errorComparison is an array of length N+2 with gives
% the absolute value of the difference between each
% iteration in the secant method and knownRoot
% logComparison is an array of length N+1 which contains the
% convergence rates as seen in A2

logComparison = zeros(1, N+1);

% In order for an appropriate comparison between the two
% methods to occur. The same initial conditions must be
% given
% In the context of the secant method, Newton's method is
% called in order to generate x1 for a given initial
% condition x0

[~, allzn] = Newton(f, df, z0, 2);
[~, allxn] = derivFree(allzn(1) , allzn(2), f, N);

errorComparison = abs(allxn - knownRoot);

% The for loop updates each element of logComparison with
% the quantity log(e_n+1) / log (e_n), where e_n is the
% error at the n-th iteration

for i = (1:N+1)

    logComparison(i) = log10(errorComparison(i+1)) ...
        / log10(errorComparison(i));

end

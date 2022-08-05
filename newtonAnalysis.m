 
% A function that outputs a semilog plot and error
% array for the convergence of Newton's method to a known
% root
% NB: The function Newton must be in the current folder

function [semilogPlot, errorArray] = newtonAnalysis(f, df, ...
z0, N, expectedRoot)
% Inputs:
% f is a function and df its derivative
% z0 is the initial data (complex) 
% N is the number of iterations 
% expectedRoot the root that we expect Newtons method to
% converge to for our given starting value

% Return values:
% semilogPlot is a semilog plot of the error against n 
% errorArray is an array containing the sequence of errors
% for each iteration of Newton's method

% Calls the Newton function in order to generate an
% approximated root of f using Newtons method
% errorArray is generated such that the nth element is given
% by the absolute difference between the nth element in
% allzn and expectedRoot

[~, allzn] = Newton(f, df, z0, N);
errorArray = abs(allzn - expectedRoot);

% Plots a semi-log graph of errorArray against the number of
% iterations

x = linspace(0, N, N+1);

semilogPlot = semilogy(x, errorArray);
grid on
xticks(0:N);
set(gca,'fontsize',20)
xlabel ('Number of Iterations', 'fontsize', 27.5);
ylabel('Absolute Error', 'fontsize', 27.5);

end



 
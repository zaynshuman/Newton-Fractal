
% Calculates the log error ratios for each errorArray
% NB: semilogPlots.m must be run first 

% Initialised 3 arrays of size N
% The for loop iterates through each element in these arrays
% and updates the nth element with the quantity  
% log(e_n+1) / log(e_n) as defined in A3

ratioTerms1 = zeros(1, N);
ratioTerms2 = zeros(1, N);
ratioTerms3 = zeros(1, N);

for i = (1:N)

    ratioTerms1(i) = log10(errorArray1(i+1)) / log10(errorArray1(i));
    ratioTerms2(i) = log10(errorArray2(i+1)) / log10(errorArray2(i));
    ratioTerms3(i) = log10(errorArray3(i+1)) / log10(errorArray3(i));

end


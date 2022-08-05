
% Displays the Newton Fractal for f(z) = z^5 - 1

% Initialises the variables M, R as required.  
% Intialises a square Matrix A and C, of size M
% Initialises x, an array of size 1xM which serves to store
% the values x_i

% We increase the resolution to create a 750 x 750 matrix
% for C, this increases clarity when zooming into the plot

M = 750;

A = zeros(M, M);
C = zeros(M, M);
x = zeros(1, M);

% z is intitialised as a complex number for use later
% allzn is initialised as an array of length N+1 to contain
% the j Newton's method iterations for each i

N = 100;
z = 1 + 1j;
allzn = zeros(N+1, 1);

 
rootsPolynomial = roots([1, 0, 0, 0, 0, -1]);

% Updates each element in x using the formula defined for
% x_i and y_i in A3, where i represents the current index 
% position in x


% The x and y axis are restricted to between -1 and 0, with
% 1/M points

for i = 1:M
    y(i) = -1 + ((1 * (i)) / (M));
end

for i = 1:M
    x(i) = -01 + ((1 * (i)) / (M));
end

% Since x_i = y_i for all i, we can create a new variable
% to represent the array of y_i values and set this equal
% to x

y = x;

% The aim here is as follows: 
% 1. Create an array, A, which stores the Newton's method
% approximation to f(z), for a given starting value 
% (x_i) + (y_j)i in the i-jth position
% 2. Use the array A to find a value from 1 to 5,
% representing the indices in rootsPolynomial that the i-jth
% element in A is closest to
% 3. Multiply this value by some constant and add the number
% of iterations required to reach some tolerance and store
% this value in the i-jth position of C

% The nested for loop iterates through all j values from 
% 1 to M, for every i value from 1 to M

for i = 1:M

    for j = 1:M

        % Step 1, with 100 iterations of Newton's methods as
        % required
 
        [z, allzn] = Newton(@(z) (z^5 - 1), @(z) (5*z^4),...
            x(i) + (y(j) * ((-1)^(1/2))), 100);
    
        A(i,j) = z;

        % Step 2, we find the minimum of the absolute distance between
        % the i-jth element in A and each of the solutions in 
        % rootPolynomial
        % The i-jth position in C is updated by the index position of 
        % this minimum value this corresponds with the required index 
        % position for step 2

        [minValue, closestIndex] = ... 
            min(abs(A(i,j) - rootsPolynomial(1:5)));
        
        % Step 3, we initialise k and n in the for loop as 1, we
        % iterate over every value in allzn until the final value
        % (allzn(101)) and check that the three conditions specified
        % in the while loop are met
        % If these conditions are not met, then the while loop while
        % continue to update the value of n by 1, up to the limit of
        % n = 15
 
        k = 1;
        n = 1;
    
        while ((abs(allzn(k) - rootsPolynomial(closestIndex)))...
            > 0.1) && (k <= 101) && (n <= 15)

            n = n+1;
            k = k+1;
              
        end
        
        % Updatse the i-jth element of C as specified by step 3

        C(i, j) = 30 * (closestIndex - 1) + 1.75 * n;
    end
end

% Plots C using pcolor and marks the location of the five
% roots in rootsPolynomial 
% The axis are unconventional - the x axis is the complex 
% axis and the y axis the real axis

hold on 
pcolor(x, y, C)
colormap(hsv)
plot(imag(rootsPolynomial(2)), real(rootsPolynomial(2)),'k*',...
 "markersize", 20)
xlabel('Imaginary axis')
ylabel('Real axis')
shading flat

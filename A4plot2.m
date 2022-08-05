
% Displays the Newton Fractal for f(z) = z^8+15z^4-16 for x
% and y between -1 and 1

% Initialises the variables M, R as required.  
% Intialises a square Matrix A and C, of size M
% Initialises x, an array of size 1xM which serves to store
% the values x_i

% We find the roots of z^8+15z^4 -16 = 0 utilising MATLABs
% inbuilt roots function

rootsPolynomial = roots([1, 0, 0, 0, 15, 0, 0, 0, -16]);

% We increase the resolution of our plot by increasing M,
% which represents the size of the square matric C and the
% number of values (points) in X and Y

% We restrict R to 1, to restrict the range of the imaginary
% axis from -1 to 1. This allows us to zoom into the centre
% of the plot 

M = 750;
R = 1;
A = zeros(M, M);
C = zeros(M, M);
x = zeros(1, M);
 
% Updates each element in x using the formula defined for
% x_i and y_i in A3, where i represents the current index 
% position in x

for i = 1:M
    x(i) = - R + ((2 * R * (i - 1)) / (M - 1));
end

% Since x_i = y_i for all i, we can create a new variable
% to represent the array of y_i values and set this equal
% to x

y = x;

% The aim here is as follows: 
% 1. Create an array, A, which stores the Newton's method
% approximation to f(z), for a given starting value 
% (x_i) + (y_j)i in the i-jth position
% 2. Use the array A to update the corresponding i-jth
% element in C with values 1 to 8, respresenting the indices
% in rootsPolynomial that the corresponding element in A is
% closest to


% The nested for loop iterates through all j values from 
% 1 to M, for every i value from 1 to M

for i = 1:M

    for j = 1:M

        % Step 1, with 100 iterations of Newton's methods as
        % required
 
        A(i,j) = Newton(@(z) (z^8+15*z^4 -16), @(z) (8*z^7 + 60*z^3),...
            x(i) + (y(j) * ((-1)^(1/2))), 100);    
        
        % Step 2, we find the minimum of the absolute distance between
        % the i-jth element in A and each of the solutions in 
        % rootPolynomial
        % The i-jth position in C is updated by the index position of 
        % this minimum value this corresponds with the required index 
        % position for step 2

        [minValue, closestIndex] = ... 
            min(abs(A(i, j) - rootsPolynomial(1:8)));
        C(i,j) = closestIndex;
    end
end

% Plots C using pcolor and marks the location of the eight
% roots in rootsPolynomial, should these appear in the plot
% The axis are not conventional - the x axis is the complex 
% axis and the y axis the real axis
% A colormap is used to set the colormap for the current 
% figure to the colormap specified by map (jet)

hold on 
pcolor(x, y, C)
colormap(jet)
plot(imag(rootsPolynomial), real(rootsPolynomial), 'k*',...
 "markersize", 15)
xlabel('Imaginary axis')
ylabel('Real axis')
shading flat
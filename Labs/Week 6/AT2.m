% INPUT 
% Retreive the delta x variable
dX = input('Input the change in x to calculate the approximate integral: ');

% CALCULATIONS
% For each delta x between 0 and 1 calc the trapezoid area and add it to a sum
% call recursion function
sum = trap(0, dX);
 
% OUTPUTS
% output the trapezoidal sum
fprintf('The approximate integral between 0 and 1 with a delta x of %f is %f\n', dX, sum);
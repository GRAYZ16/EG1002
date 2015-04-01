% GENERAL PROGRAM HEADER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;

% INPUTS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Retrieve the gradient point to be calculated (0 <= x <= 10)
x = input('Insert the point in which you would like to calculate the approximate derivative(between 0 and 10): ');
if(x > 10 || x < 0)
    error('Invalid Value, ending program');
end
% Retrieve the difference in x to be used (delta x)
dX = input('Input the change in x (delta x) to be used to calculate the approximate derivative: ');

% VARIABLES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize a vector of x values equally spaced between two arbitrary values
xValues = linspace(0, 10, 10/ dX);

% CALCULATIONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate a vector of y values corresponding to x values to generate coordinate points for the function
yValues = yfunction(xValues);

% calculate the gradient at point x using delta x and the y values (delta y / delta x)
dY = yfunction(x + dX) - yfunction(x);

slope = dY/dX;

%calculate the exact derivative slope at point x
slopeDeriv = 2 * x^3 + 0.5 * x;

% OUTPUTS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot the function for the y values
plot(xValues, yValues);
hold on;
% plot the point at y = f(x)
plot(x, yfunction(x), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
% plot the tangent line at y = f(x)
tanValues = slope * (xValues - x) + yfunction(x);
plot(xValues, tanValues, 'g');

% Print the values of the slope
fprintf('The slope using the standard average gradident formula for the interval %f is %f\n', dX, slope);
fprintf('The slope using the exact derivative is %f\n', slopeDeriv);
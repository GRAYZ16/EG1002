% Monte Carlo Method

% INPUT
% Specify the amount of points to generate
numPoints = input('Specify the amount of points to randomly generate: ');

% CALCULATIONS
% Plot generation 
xAxis = linspace(0, 1, numPoints);
% Generate a plot of the function
yAxis = expFunc(xAxis);
% generate random x and y points for inputted amount of points
xPoints = rand(1, numPoints);
yPoints = 3 * rand(1, numPoints);

% determine the points that fall above and below the function within the bounds
pointsUnderCurve = numel(yPoints(yPoints - yAxis < 0));

% Area = points under curve / numPoints * interval
areaCurve = (pointsUnderCurve / numPoints) * 3;

% OUTPUTS
% display plot
plot(xAxis, yAxis);
hold on;
scatter(xPoints, yPoints, 'filled');

% display area under curve calculation
fprintf('The approximate integral of the function where 0 <= x <= 1 is %f\n', areaCurve);

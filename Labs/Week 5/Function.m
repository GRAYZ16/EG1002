%Plotting the normal distribution

x = linspace(-10, 10);
mean = 0;

for stdDev = 1:5
    y = (1/(stdDev * sqrt(2 * pi))) * exp(-((x - mean).^2)/(2 * stdDev^2));
    plot(x,y);
    hold on;
end
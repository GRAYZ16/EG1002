function stdDev = calcStdDev(data)
   mn = calcMean(data);
   stdDev = sqrt(calcMean((data-mn).^2));
end
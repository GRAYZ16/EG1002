polyData = load('polydata.csv');

 x= linspace(1, 10, 50);
 polyCoef = polyfit(x, polyData(:, 2).', 3);
 y = polyval(polyCoef, x);
 
 eqStr = sprintf('%0.4f x^{3} + %0.4f x^{2} + %0.4f x + %0.4f', polyCoef);
 
 plot(x, polyData(:, 2).', 'o');
 hold on;
 plot(x, y,'r--');
 legend('Poly Data', eqStr);
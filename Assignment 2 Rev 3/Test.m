%Test Main File
clc();
clear();
load('SolarNew.mat');

global particles;
global dt;

time = 0;
plotStep = 0;
setPlot(10, 10, 10);

while time < 10000000
   runSimulation();
   
    plotSystem();    
    pause(1/65);
   
   plotStep = plotStep + 1;
   time = time + dt;
end

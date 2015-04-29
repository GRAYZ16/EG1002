%Test Main File
clc();
clear();
load('SolarSystem.mat');

global particles;
global dt;

time = 0;
plotStep = 0;
initPlot();

while time < 10000
   runSimulation();
   if plotStep == 32
    plotSystem();    
    pause(1/256);
    plotStep = 0;
   end
   plotStep = plotStep + 1;
   time = time + dt;
end

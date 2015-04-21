%Base Variable File
clc();
clear();
load('BaseVariables.mat');

global particles;
global dt;

time = 0;
setPlot(10, 10, 10);

while time < 2.5
   runSimulation();   
   time = time + dt;
   plotSystem();
   pause(0.4);
end

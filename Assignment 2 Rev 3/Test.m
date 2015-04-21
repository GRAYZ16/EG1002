%Test Main File
clc();
clear();
load('SolarSystem.mat');

global particles;
global dt;

time = 0;
plotStep = 0;
setPlot(10, 10, 10);

while time < 1000000000000000000
   for particle = 1:size(particles, 1)
      force = getForce(particle);
      particles(particle).acceleration = getAcceleration(particle, force);
      particles(particle).velocity = getVelocity(particle);
      particles(particle).position = getPosition(particle);
   end
   
   if plotStep == 128
    plotSystem();
    plotStep = 0;
    pause(1/65);
   end
   
   plotStep = plotStep + 1;
   time = time + dt;
end

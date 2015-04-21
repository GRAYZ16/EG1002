%Test Program
%General Header
clear();
clc();

%Initialisation
load('initialCondition.mat');

time = 0;

%Calculation
while time <= 2.5
force = calcForce(particles);
disp(force);
particles(:, 5:7) = calcVelocity(particles, force, dt);
disp(particles(:, 5:7));
particles(:, 2:4) = calcDisplacement(particles, dt, force);
disp(particles(:, 2:4));
time = time + dt;
end


%Output
scatter(particles(:, 2), particles(:, 3));
xlim([-10 10]);
ylim([-10,10]);
%scatter3(particles(:, 2), particles(:, 3), particles(:, 4));
%Test Program
%General Header
clear();
clc();

%Initialisation
load('initialCondition.mat');

%Calculation
force = calcForce(particles);



%Output
scatter(particles(:, 2), particles(:, 3));
xlim([-10 10]);
%scatter3(particles(:, 2), particles(:, 3), particles(:, 4));
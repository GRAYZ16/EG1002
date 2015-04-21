function [accel velocity] = calcVelocity(particleID, dt, force, particles)
    %UNTITLED5 Summary of this function goes here
    %   Detailed explanation goes here
    accel = force ./ particles{particleID, 2};
    
    velocity = particles{particleID, 4} + accel * dt;
end


function position=calcDisplacement(particles, dt, force)
    
    massVector = particles(:, 1);
    
    accel = force./massVector(:, ones(1, size(force, 2)))
    accelVel = 1/2 * accel * dt^2;
    
    position = particles(:, 5:7) .* dt + particles(:, 2:4) + accelVel(:, ones(1, size(force, 2)));
end
function velocity=calcVelocity(particles, force, dt)
    
    massVector = particles(:, 1);
    
    velocity = (force .* dt)./massVector(:, ones(1, size(force, 2))); %+ particles(:, 5:7);
end
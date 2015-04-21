function force= calcForce(particleID, const_grav, particles)
    %Calculate Force Calculates the forces on a particle
    %   For an input particleID, calculates the sum of the forces acting on
    %   the particle.
    force = zeros(1, 3);
    
    for particle = 1:size(particles, 1)
        if particle == particleID
            continue;
        end
        
       body_distance = particles{particle, 3} - particles{particleID, 3};
       mass = particles{particle, 2} * particles{particleID, 2};
       force = force + const_grav * mass * body_distance ./ (body_distance).^3;
       force(isnan(force)) = 0
    end
end


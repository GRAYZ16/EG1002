function force = getForce(particleID)
    %GET FORCE Finds the sum of the forces acting on particleID in
    %particles
    global particles;
    global const_grav;
    
    force = 0;
    
    for particle = 1:size(particles, 1)
        if particle == particleID
            continue;
        end
        
        distance_vector = particles(particle).position - particles(particleID).position;
        distance = sqrt(sum(distance_vector.^2));
        mass = particles(particleID).mass * particles(particle).mass;
        unit_vector = distance_vector / distance;
        force = force + (const_grav * (mass/(distance^2))).* unit_vector;       
    end
end


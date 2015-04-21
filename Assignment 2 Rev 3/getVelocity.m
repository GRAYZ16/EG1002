function velocity = getVelocity(particleID)
    %GET VELOCITY calculates the velocity of particleID in particles
    %   Detailed explanation goes here
    global particles;
    global dt;
    
    velocity = particles(particleID).velocity + dt * particles(particleID).acceleration;
end


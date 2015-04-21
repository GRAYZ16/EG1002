function acceleration = getAcceleration(particleID, force)
    %GET ACCELERATION calculates the acceleration of particleID in
    %particles
    global particles;
    
    acceleration = force / particles(particleID).mass;
end


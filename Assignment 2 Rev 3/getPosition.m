function position = getPosition(particleID)
    %GET POSITION calculates the position of particleID for a given time    
    global particles;
    global dt;
    
    position = particles(particleID).position + particles(particleID).velocity * dt;    
end


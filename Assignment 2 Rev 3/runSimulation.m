function runSimulation()
    %UNTITLED2 Summary of this function goes here
    %   Detailed explanation goes here
    global particles;
    
   for particle = 1:size(particles, 1)
      force = getForce(particle);
      particles(particle).acceleration = getAcceleration(particle, force);
      particles(particle).velocity = getVelocity(particle);
      particles(particle).position = getPosition(particle);
   end
end


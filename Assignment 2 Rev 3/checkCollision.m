function checkCollision(particleID)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    global particles;
    global merge_proximity;
    
    for particle = 1:size(particles, 1)
       if particle == particleID 
           continue;
       else if particles(particleID).mass == 0 || particles(particle).mass == 0
               continue;
           end
       end
       proximity = sqrt(sum((particles(particle).position - particles(particleID).position).^2));
       
       if proximity < merge_proximity
           particles(particleID).mass = particles(particleID).mass + particles(particle).mass;
           particles(particleID).velocity = (particles(particleID).mass * particles(particleID).velocity +  particles(particle).mass * particles(particle).velocity)/(particles(particleID).mass + particles(particle).mass);
           particles(particle).mass = 0;
           particles(particle).position = [20, 20, 20];
           particles(particle).velocity = [0,0,0];
       end
    end
    
end

function runSimulation()
    %RUN SIMULATION
    %   Runs the simulation code through once
    global particles;
    
   for particle = 1:size(particles, 1)
       
      checkCollision(particle); 
      force = getForce(particle);
      particles(particle).acceleration = getAcceleration(particle, force);
      particles(particle).velocity = getVelocity(particle);
      particles(particle).position = getPosition(particle);
   end
end

function checkCollision(particleID)
    %CHECK COLLISION compares each particle against each other and
    %detects the collisions in the system
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

function force = getForce(particleID)
    %GET FORCE Finds the sum of the forces acting on particleID in
    %particles
    global particles;
    global const_grav;
    
    force = 0;
    
    for particle = 1:size(particles, 1)
        if particle == particleID
            continue;
        else if particles(particle).mass == 0 || particles(particleID).mass == 0
                continue;
            end
        end
        
        distance_vector = particles(particle).position - particles(particleID).position;
        distance = sqrt(sum(distance_vector.^2));
        unit_vector = distance_vector / distance;
        force = force + (const_grav * ((particles(particleID).mass * particles(particle).mass)/(distance^2))).* unit_vector;       
    end
end

function acceleration = getAcceleration(particleID, force)
    %GET ACCELERATION calculates the acceleration of particleID in
    %particles
    global particles;
    
    acceleration = force / particles(particleID).mass;
end

function velocity = getVelocity(particleID)
    %GET VELOCITY calculates the velocity of particleID in particles
    global particles;
    global dt;
    
    velocity = particles(particleID).velocity + dt * particles(particleID).acceleration;
end

function position = getPosition(particleID)
    %GET POSITION calculates the position of particleID for a given time    
    global particles;
    global dt;
    
    position = particles(particleID).position + particles(particleID).velocity * dt;    
end
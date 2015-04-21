%Test File
load('initial.mat');

force = zeros(1, 3);
time = 0;
positions = zeros(25, 3, 2);

ii = 1;

while time < 2.5    
    
    for particle = 1:size(particles, 1)               
        
        force = calcForce(particle, const_grav, particles);
        
        [particles{particle, 5} particles{particle, 4}]  = calcVelocity(particle, dt, force, particles);
                
        particles{particle, 3} = calcDisplacement(particle, dt, particles);
        positions(ii, :, particle) = particles{particle, 3};
        positions(ii, :, particle) = particles{particle, 3};
    end
    ii = ii + 1;
    time = time + dt;
end
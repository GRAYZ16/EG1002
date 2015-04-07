function forces=calcForce(particles)
    
    forces = zeros(numel(particles)/7, 3);
    
    for particle = 1:(numel(particles)/7)
        for forceComponent = 2:4
            forceComponents = 6.673e-11*((particles(particle,1).*particles(:,1))./(-(particles(particle,forceComponent)-particles(:, forceComponent)).* abs(particles(particle,forceComponent)-particles(:, forceComponent))));
            forceComponents(particle) = 0;
            forceComponents(~isfinite(forceComponents)) = 0;
            forces(particle, forceComponent-1) = sum(forceComponents);
        end
    end
end
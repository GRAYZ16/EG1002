function forces=calcForce(particles)
    
    forces = NaN(size(particles, 1), 3);
    massVector = particles(:, 1);
    positionMat = particles(:, 2:4);
    gValue = 6.673e-11;
    
    for particle = 1:(size(particles, 1))
        massParticle = massVector(particle);        
        posParticle  = positionMat(particle, :);
        massProduct = massParticle(:, ones(size(massVector, 2),1)).*(massVector);
        displacement = -((posParticle(ones(size(positionMat, 1),1), :))-positionMat) .* abs((posParticle(ones(size(positionMat, 1),1), :))-positionMat);
        forceComponents = gValue * (massProduct(:,ones(size(displacement,2),1))./displacement);
        forceComponents(~isfinite(forceComponents)) = 0;
        forces(particle, :) = sum(forceComponents);
    end    
    
end
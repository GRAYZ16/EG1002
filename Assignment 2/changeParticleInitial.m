function changeParticleInitial(particle, varargin)
    load('initialCondition.mat');
    
    if nargin == 4
        particles(particle, : ) = [varargin{1}, varargin{2}, varargin{3}]; %#ok<*NASGU>
    elseif nargin == 8
        particles(particle, :) = [varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}];
    else 
        error('Wrong Number of inputs, either use changeParticleInitial(particle, posVector, velVector) or changeParticleInitial(particle, xPos, yPos, zPos, xVel, yVel, zVel)');
    end
    
    fprintf('Particle No: %f\nMass: %f\n\nPosition:\n\tX: %f\n\tY: %f\n\tZ: %f\n\nVelocities:\n\tX: %f\n\tY: %f\n\tZ: %f\n', particle, particles(particle, 1),particles(particle, 2), particles(particle, 3), particles(particle, 4), particles(particle, 5), particles(particle, 6), particles(particle, 7));
    
    save('initialCondition.mat', 'particles');
end
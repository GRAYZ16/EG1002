function ChangeInitialConditions(file, varargin)
    %Change the intial conditions of a file
    %   Modify one particle at a time
    load(file);  
    
    switch(nargin)
        case 1 
            in = input('Do you wish to create or edit a particle(E/C)? ', 's');
            switch in
                case 'E'
                    changeParticle();
                case 'C'
                    createParticle();
            end
        case 2
            changeConstant(varargin(2));
        case 6
            changeParticle(varagin(2:6));
        otherwise
            error('Number of inputs not valid');
    end 
    
    save(file, 'particles', 'dt', 'const_grav', 'merge_proximity');
end

function changeParticle(varargin)    
    if nargin == 5
      modifyParticles(varargin(1), varargin(2), varargin(3), varargin(4), varargin(5));
    else
        ID = input('Enter the particleID of the particle you wish to edit: ');
        if isempty(ID)
            error('You Must Input a particleID');
        end
        
        name = input('Enter the new particle name: ', 's')
        mass = input('Enter the new particle mass: ', 's')
        position = input('Enter the new particle position vector: ', 's')
        velocity = input('Enter the new particle velocity: ', 's')  
        
        modifyParticles(name, mass, position, velocity);
    end
end

function createParticle()    
    global particles;
    
    name = input('Enter the new particle name: ', 's');
    mass = input('Enter the new particle mass: ');
    position = input('Enter the new particle position vector: ');
    velocity = input('Enter the new particle velocity: '); 
    
    modifyParticles(size(particles, 1) + 1, name, mass, position, velocity);
    fprintf('New Particle Created with ID: %i\n', size(particles, 1) + 1);
end

function modifyParticles(ID, name, mass, position, velocity)
    global particles;
    
    particles(ID).name = name;
    particles(ID).mass = mass;
    particles(ID).position = position;
    particles(ID).velocity = velocity;
    printDetails(ID);
end

function changeConstant(code)
    switch code
        case 'g'
            global const_grav
            const_grav = input('Input new Constant of Gravity: ');
        case 't'
            global dt;
            dt = input('Input new timestep "dt": ');
        case 'p'
            global merge_proximity
            merge_proximity = input('Enter new collision merge proximity: ');
        otherwise
            error('Constant not available');
    end
end

function printDetails(id)
    global particles;
    fprintf('Name: %s\n', particles(id).name);
    fprintf('\tMass: %f\n', particles(id).mass);
    fprintf('\tPosition: [%f %f %f]\n', particles(id).position);
    fprintf('\tVelocity: [%f %f %f]\n\n', particles(id).velocity);
end
    


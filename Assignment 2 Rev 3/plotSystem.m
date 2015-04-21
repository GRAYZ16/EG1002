function plotSystem()
    %PLOT SYSTEM Summary of this function goes here
    %   Detailed explanation goes here
   
    global particles;
    
    for particle = 1:size(particles)
        
        switch(particle)
            case 1
                plotColour = 'r';
            case 2 
                plotColour = 'g';
            case 3 
                plotColour = 'b';
            case 4 
                plotColour = 'm';
            otherwise
                plotColour = 'y';
        end
        scatter3(particles(particle).position(1,1), particles(particle).position(1, 2), particles(particle).position(1, 3), plotColour);       
    end
end
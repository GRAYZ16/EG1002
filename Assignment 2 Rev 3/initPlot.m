function initPlot()
    % INIT PLOT - Initialises the plot for use in the simulation
    %   Detailed explanation goes here
    figure('Color',[0 0 0], 'Name', 'Simulation');
    set(gcf,'NumberTitle','off');
    axis off;
    axis equal;
    hold all;
    view(3);    
    
    global particle_size;
    global particles;
    masses = zeros(size(particles,1));
    
    for particle = 1:size(particles, 1)
        masses(particle) = particles(particle).mass;
    end
    
    [~, particle_size] = sort(masses);
end


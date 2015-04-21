function position = calcDisplacement(particleID, dt, particles)
    %UNTITLED7 Summary of this function goes here
    %   Detailed explanation goes here
    position = particles{particleID, 4} * dt + particles{particleID, 3} +(particles{particleID, 5} * dt^2)/2;
end


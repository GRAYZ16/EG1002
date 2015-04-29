function BaseProgram()
   setup();
   run();
end

function setup()
    clc();
    clear();
    load('BaseVariables.mat');
    initPlot();
    view(2);
end

function run()
    
    time = 0;
    global dt;
    
    while time < 2.5
       runSimulation();
       time = time + dt;
       plotSystem();
       pause(0.4);
    end
end
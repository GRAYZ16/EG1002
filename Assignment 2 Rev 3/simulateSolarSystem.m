function simulateSolarSystem(runTime)
   setup();  
   run(runTime);
end

function setup()
 clc();
 clear(); 
 load('SolarSystem.mat');
 initPlot(); 
end

function run(runTime)    
   global dt; 
   
   total_time = 0;
   plot_step = 0;

   while total_time < runTime
        runSimulation();

        if plot_step == 32
            plotSystem();
            pause(1/256);            
            plot_step = 0;
        end

        plot_step = plot_step + 1;
        total_time = total_time + dt;
   end
end
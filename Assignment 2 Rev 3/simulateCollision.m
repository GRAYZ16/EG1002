function simulateCollision(runTime)
   setup();  
   run(runTime);
end

function setup()
 clc();
 clear(); 
 load('InitialMultiple');
 initPlot(); 
end

function run(runTime)    
   global dt; 
   
   total_time = 0;
   plot_step = 0;

   while total_time < runTime
        runSimulation();

        if plot_step == 128
            plotSystem();
            plot_step = 0;
            pause(1/64);
        end

        plot_step = plot_step + 1;
        total_time = total_time + dt;
   end
end
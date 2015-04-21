function plotParticles(runTime)
   setup();
   load('InitialMultiple');
   
   global dt;
   
   total_time = 0;
   plot_step = 0;
   
   while total_time < runTime
      runSimulation();
      
      if plot_step == 128
          plotSystem();
          plot_step = 0;
          pause(1/65);
      end
      
      plot_step = plot_step + 1;
      total_time = total_time + dt;
   end   
end

function setup()
 clc();
 clear();
 setPlot();
end
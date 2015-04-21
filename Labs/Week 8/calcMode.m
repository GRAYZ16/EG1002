function [mode,modeOccurence]=calcMode(data)
   %Calculates the mode of a set of data
     
   %Sorts the input data in order 
   data = sort(data);
   %Converts the data such that each sequential number becomes a running
   %sum of the number of occurences e.g.  data = [1 1 2 2 2] would become
   %positions = [2 5]
   positions = find(diff([data, realmax]) > 0);
   %When this operation is performed, the exact amount of occurences of
   %each number is calculated e.g. positions = [2 5] would result in [2 3]
   %and finding the max of this results in the mode of the data e.g. 2
   [modeOccurence,modePos] = max(diff([0, positions]));
   mode = data(positions(modePos));
end
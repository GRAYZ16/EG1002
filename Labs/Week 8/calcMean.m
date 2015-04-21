function mean=calcMean(data)
    
    sum_tot = 0;
    
    for ii = 1:size(data, 2)
       sum_tot = sum_tot + data(ii); 
    end
    
   mean = sum_tot/size(data, 2);
end
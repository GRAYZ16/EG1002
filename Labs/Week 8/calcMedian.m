function median=calcMedian(data)
    
    data = sort(data);
    
    if mod(numel(data), 2) ~= 0 
       median = data(ceil(numel(data)/2)); 
    else
       med = floor(numel(data)/ 2);
       median = (data(med) + data(med + 1)) / 2; 
    end
end
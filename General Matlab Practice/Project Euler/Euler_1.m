sum = 0;

for ii = 1:1000
     delta = sum;
    
     if 5 * ii < 1000
        sum = 5 * ii + sum;
     end
    
     if 5 * ii < 1000
        sum = 3 * ii + sum;
     end
    
     if sum == delta
         break;
     end
end

sum
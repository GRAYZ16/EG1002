% RECURSION LOGIC
% TRAP FUNCTION
% if x is not 1, calculate the next trapezoid
% Add the area to the area of x + 1
function out = trap(x, dX)
    if(x >= 1 + dX)
        out =  0;
    else    
        out = (((expFunc(x) + expFunc(x + dX))/2) * dX) + trap(x + dX, dX);
    end
end


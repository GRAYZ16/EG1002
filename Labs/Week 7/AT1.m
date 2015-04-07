matDim = input('Input a matrix dimension to calculate the values of the simultaneous equations: ');

if matDim ~= round(matDim)
    error('Input an Integer Value. Exiting...');
end

equations = zeros(matDim);

for ii = 1:(matDim - 1)
   equations(ii,ii) = -2;
   equations(ii, ii+1) = 1;    
end

equations(matDim, matDim) = -2;

resultVector = zeros(matDim, 1);
resultVector(1) = -400;
resultVector(matDim) = -600;


tValues = equations \ resultVector;

fprintf('The solution to the %f simultaneous equations given is:\n\n', matDim);
fprintf('\t%f\n', tValues);
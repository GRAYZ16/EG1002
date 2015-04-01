%Unsorting an array

n = input('Select an array size to shuffle: ');

shuffle = randsample(1:n, n);

fprintf('The Shuffled array is: ');
fprintf('%s', num2str(shuffle));
fprintf('\n');
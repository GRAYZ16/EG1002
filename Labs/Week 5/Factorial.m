%% Lab 5 Factorial Script

%Input from User
in = round(input('What factorial would you like to know?\nvalue: '));

%Generate array to hold values
values = zeros(1, in);
%set the initial value to 1 for factorial
values(1) = 1;

%for loop to generate factorial values
for val = 2:in
    %currentValue = value * prevValue
    values(val) = val * values(val - 1);
end

%Print details to screen
fprintf('%s! = %s\n', num2str(in), num2str(values(in)));
fprintf('All factorials 1 to %s = ', num2str(in));
fprintf('%s', num2str(values));
fprintf('\n');
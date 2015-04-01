%EG1002 Lab 2 - for loops

% Clear the command window
clc;
clear;

n = round(input('Enter a even number: '));

sum = 0;


for k = 2:2:n
    sum = sum + k;   
end

% Print final sum
sum

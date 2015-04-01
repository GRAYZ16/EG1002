clc;
clear;

%Assessable Task 1
%NO OLDER 120
age = abs(floor(input('Input your age: ')));
ageRange = [0 1 13 18 60 Inf];
ageDescription = cellstr(['Baby    '; 'Child   '; 'Teenager'; 'Adult   '; 'Senior  ']);

for a = 1:5
    if ageRange(a) == age || age < ageRange(a + 1)
        disp(ageDescription(a));
        break;
    end
end
dt = 0.1;
m = 10;
k = 5;
g = 9.81;
s = [];
v = [];
a = [];
time = 0;

s(1) = 0;
v(1) = 0;
a(1) = 9.81;

i = 1;


while s(i) < 5
    i = i+1;
    a(i) = -(k/m) * v(i-1)^2 + g;
    v(i) = dt * (a(i)) + v(i-1);
    s(i) = v(i) * dt + s(i-1);   
    time = time + dt;
end
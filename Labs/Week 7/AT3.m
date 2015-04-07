dt = 0.1;
s = zeros(1, 10);
v = zeros(1, 10);
fallHeight = 5;
t = zeros(1, 10);
m = 10;
k = 5;
g = 9.81;

count = 2;

while fallHeight > 0
    v(count) = (g - (k * v(count -1)^2 / m)) * dt + v(count -1);
    s(count) = v(count) * dt + s(count -1);
    count= count + 1;
    fallHeight = s(count);
end

for ii = 2:10
    t(ii) = t(ii -1) + dt;
end

plot(t, s);
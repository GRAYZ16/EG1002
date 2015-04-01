
%% Variables
k = 1;
w = 1;
t = linspace(0,10,100);
%initialise an empty array
y = [];
%loop through all positions in y to geneate a value.
for ii = 1:length(t)
    y(ii) = exp(-k * t(ii)) .* sin(w * t(ii));
end

plot(t,y)

%% Vectorised

k = 1;
w = 1;
t = linspace(0, 10, 100);

y = zeros(length(t));

y = exp(-k * t) .* sin(w * t);

plot(t,y);


x = linspace(-1, 1);
y = zeros(size(x));
for i=1:size(x,2)
    y(i) = exp(-x(i))/((1 + exp(-x(i)))^2);
end
plot(x, y);
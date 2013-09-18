function w = kernal_weight(X, x, tao)
% return a weight vector of all data in X, as x centered
%   Detailed explanation goes here
[m, n] = size(X);
for i=1:m
    w(i) = exp(-norm(x - X(i,:)) / (2 * tao^2));
end


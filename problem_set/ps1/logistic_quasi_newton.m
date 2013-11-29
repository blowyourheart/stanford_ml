function [theta, ll] = logistic_quasi_newton(X,Y)

% rows of X are training samples, including the intercerp
% rows of Y are corresponding 0/1 values

% output ll: vector of log-likelihood values at each iteration
% ouptut theta: parameters


[m,n] = size(X);

theta = zeros(n,1);
max_iters = 500;
epsilon = 1e-4;
G = diag(ones(n, 1));
lambda = 0.01;
grad_last = zeros(n, 1);
for i=1:max_iters
    grad = zeros(n,1);
    ll(i)=0;
    % compute gradient
    for j=1:m
        hxj = sigmoid(X(j,:)*theta);
        grad = grad - X(j,:)'*(Y(j) - hxj);
        % ll(i) is the likelihood of last loop's theta.
        ll(i) = ll(i) + Y(j)*log(hxj) + (1-Y(j))*log(1-hxj);
    end
    if norm(grad) <= epsilon
        break
    end
    pk = -G * grad;
    theta = theta + lambda * pk;
    %没有实现拟牛顿算法，可能需要其他方式来弄下。
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




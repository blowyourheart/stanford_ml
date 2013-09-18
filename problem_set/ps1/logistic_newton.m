function [theta, ll] = logistic_newton(X,Y)

% rows of X are training samples, including the intercerp
% rows of Y are corresponding 0/1 values

% output ll: vector of log-likelihood values at each iteration
% ouptut theta: parameters


[m,n] = size(X);

theta = zeros(n,1);
max_iters = 50;
for i=1:max_iters
    grad = zeros(n,1);
    ll(i)=0;
    H = zeros(n,n);
    for j=1:m
        hxj = sigmoid(X(j,:)*theta);
        grad = grad + X(j,:)'*(Y(j) - hxj);
        H = H - hxj*(1-hxj)*X(j,:)'*X(j,:);
        % ll(i) is the likelihood of last loop's theta.
        ll(i) = ll(i) + Y(j)*log(hxj) + (1-Y(j))*log(1-hxj);
    end
    theta = theta - inv(H)*grad;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




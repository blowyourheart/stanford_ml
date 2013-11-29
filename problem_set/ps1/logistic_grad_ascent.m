function [theta, ll] = logistic_grad_ascent(X,y)

% rows of X are training samples including the intercerp
% rows of Y are corresponding 0/1 values

% output ll: vector of log-likelihood values at each iteration
% ouptut theta: parameters

alpha = 0.001;

[m,n] = size(X);

max_iters = 10000;
epsilon = 1e-4;
theta = zeros(n, 1);  % initialize theta
for k = 1:max_iters
  hx = sigmoid(X*theta);
  grad = X' * (y - hx);
  theta = theta + alpha * grad; 
  ll(k) = sum( y .* log(hx) + (1 - y) .* log(1 - hx) );
  if norm(grad) <= epsilon
      fprintf('logistic_grad iteration %d\n', k);
      break
  end
  
end




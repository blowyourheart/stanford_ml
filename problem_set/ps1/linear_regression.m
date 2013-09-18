function theta = linear_regression(X,Y)

% rows of X are training samples including the intercerp
% rows of Y are the target real value
% ouptut theta: parameters
theta = inv(X' * X) * X' * Y;

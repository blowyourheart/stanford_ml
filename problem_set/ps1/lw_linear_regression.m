function theta = lw_linear_regression(X, W, Y)

% rows of X are training samples including the intercerp
% W is the diagonal m * m matrix represtent the weight
% rows of Y are the target real value
% ouptut theta: parameters
theta = inv(X' * W * X) * X' * W * Y;

%%%%%%% hw1q1.m %%%%%%%
% problem set1 problem2_d

load('q2x.dat');
load('q2y.dat');
[m, n] =size(q2x);
figure; hold on;
plot(q2x, q2y, 'rx');
new_q2x = [ones(m,1) q2x];
x = min(q2x):.1:max(q2x);
x = x';
new_x = [ones(size(x, 1), 1) x];

% linear regression
theta_lr = linear_regression(new_q2x, q2y);
y_lr = new_x * theta_lr;
plot(x, y_lr, 'b');

% local weight linear regression
vec_taus = [0.1 0.3 0.8 2 10];
colors = ['g-' 'm-' 'k-' 'y-' 'r-'];
for k = 1:size(vec_taus, 2)
    for i = 1:size(new_x, 1)
        w = kernal_weight(new_q2x, new_x(i,:), vec_taus(k));
        W = diag(w);
        theta_tmp = lw_linear_regression(new_q2x, W, q2y);
        lwlr( i) =  new_x(i,:) * theta_tmp;
    end
     plot(x, lwlr, colors(k));
end
legend('data', 'linear regression', 'tau=.1', 'tau=.3', 'tau=.8', 'tau=2', 'tau=10', 'Location', 'SouthEast');
xlabel('x');
ylabel('y');
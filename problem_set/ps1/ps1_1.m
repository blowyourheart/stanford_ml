%%%%%%% hw1q1.m %%%%%%%
% problem set1 problem1.2 1.3

load('q1x.dat');
load('q1y.dat');
q1x = [ones(size(q1x,1),1) q1x];
[theta, ll] = logistic_newton(q1x,q1y);
[theta_quasi_newton, ll_quasi_newton] = logistic_quasi_newton(q1x,q1y);
[theta_grad, ll_grad] = logistic_grad_ascent(q1x,q1y);
[m, n] =size(q1x);
figure; hold on;
for i=1:m
    if(q1y(i)==0)
        plot(q1x(i,2),q1x(i,3),'rx');
    else
        plot(q1x(i,2),q1x(i,3),'go');
    end
end
x = min(q1x(:,2)):.01:max(q1x(:,2));
%y = -theta(1)/theta(3)-theta(2)/theta(3)*x;
y_newton = -(theta(1) + theta(2)*x)/theta(3);
y_quasi_newton = -(theta_quasi_newton(1) + theta_quasi_newton(2) * x) / theta_quasi_newton(3);
y_grad = -(theta_grad(1) + theta_grad(2)*x)/theta_grad(3);
plot(x,y_newton, 'k-',x, y_quasi_newton, 'y-', x, y_grad, 'b:');
legend('logistitc newton', 'logistitc grad ascent');
xlabel('x1');
ylabel('x2');
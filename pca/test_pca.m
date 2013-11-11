%% test pca function
x = linspace(2, 4, 10);
y = 2*x + rand(size(x));
X = [x' y'];
u = mean(X);
[m, n] = size(X);
for i=1:m
    X(i,:) = X(i,:) - u;
end
%%��Э������󣬲����ÿһ�������ı�׼��
sigma = sqrt(diag(cov(X)));
%% �����һ����
sigma = sigma';
for i=1:m
    X(i,:) = X(i,:)./sigma;
end
%% ��������ֵ����������
C = cov(X);
[V, D] = eig(C);

d_vec = max(D);
[v, i] = max(d_vec);
max_v = V(:, i);
%%������ӳ�䵽��ά�ռ��У��˴�Ϊһά�ռ�
lambda_v = X*max_v;

for i=1:m
    Y(i,:) = max_v' * lambda_v(i);
end
plot(X(:, 1), X(:, 2), 'x', Y(:, 1), Y(:, 2), 'o')
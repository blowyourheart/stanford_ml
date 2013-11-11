%% test pca function
x = linspace(2, 4, 10);
y = 2*x + rand(size(x));
X = [x' y'];
u = mean(X);
[m, n] = size(X);
for i=1:m
    X(i,:) = X(i,:) - u;
end
%%求协方差矩阵，并获得每一个分量的标准差
sigma = sqrt(diag(cov(X)));
%% 将其归一化。
sigma = sigma';
for i=1:m
    X(i,:) = X(i,:)./sigma;
end
%% 计算特征值和特征向量
C = cov(X);
[V, D] = eig(C);

d_vec = max(D);
[v, i] = max(d_vec);
max_v = V(:, i);
%%将数据映射到低维空间中，此处为一维空间
lambda_v = X*max_v;

for i=1:m
    Y(i,:) = max_v' * lambda_v(i);
end
plot(X(:, 1), X(:, 2), 'x', Y(:, 1), Y(:, 2), 'o')
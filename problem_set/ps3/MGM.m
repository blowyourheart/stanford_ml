function   [mu,sigma,phi, log_like_vec]  = MGM(sampleMatrix,k,maxIteration,epsilon)
%Analysis the k guass distribution by the input matrix m
%sampleMatrix   the matrix of sample, in which each row represents a sample.
%k  the number of guass distriubtion
%maxIteration   the max times of iteration,default 1000.
%epsilon    the epsilon of loglikelihood,default 100.
%check parameters
if nargin < 4
    epsilon = 0.1;
    if nargin < 3
        maxIteration = 1000;
        if nargin < 2
            error('MATLAB:MGM:NotEnoughInputs',...
                'Not enough input arguments.  See MGM.');
        end
    end
end
if k==1
    mu = mean(sampleMatrix);
    sigma = var(sampleMatrix);
    phi = 1;
    return;
end
[sampleNum,dim] = size(sampleMatrix);

%init Mix Gauss Model parameters
% init mu vector
mu = zeros(k,dim);
for i=1:1:dim
    colVector = sampleMatrix(:,i);
    mu(i,:) = linspace(min(colVector), max(colVector), dim)';
end

% init sigma matrix
sigma = zeros(k,dim,dim);
for i=1:1:k
    sigma(i,:) = 10 * rand()* eye(dim);
    
end
% init phi vector
phi = ones(1,k) * (1.0) / k;
%the weight of sample i is generated by guass distribution j
log_like_vec = zeros(sampleNum,1);
weight = zeros(sampleNum,k);

oldlikelihood = -inf;
for iter=1:maxIteration
    loglikelihood = 0;
    %E-step
    for i=1:1:sampleNum
        for j = 1:k
            weight(i,j)=mvnpdf(sampleMatrix(i,:),mu(j,:),reshape(sigma(j,:),dim,dim))*phi(j);
        end
        %% 这里是求的给定z的分布以后的似然函数值，从公式中可以得出这个算式是正确的。
        %% 后面的对w(i, j)进行归一化以后，就是所求的Q函数了，可以重复使用这个结果
        sum_likelihood = sum(weight(i, :));        
        loglikelihood = loglikelihood + log(sum_likelihood);
        for j = 1:k
            weight(i,j)=weight(i,j)/sum_likelihood;
        end
    end
    if abs(loglikelihood-oldlikelihood) < epsilon
        break;
    else
        oldlikelihood = loglikelihood;
    end
    log_like_vec(iter) = loglikelihood;
    
    %M-step
    %update phi
    for i=1:k
        sum_ = 0;
        for j=1:sampleNum
            sum_ = sum_+weight(j,i);
        end
        phi(i) = sum_/sampleNum;
    end
    %update mu
    for i=1:k
        sum_ = zeros(1,dim);
        for j=1:sampleNum
            sum_ =  sum_+weight(j,i)*sampleMatrix(j,:);
        end
        
        mu(i,:) =  sum_/(phi(i)*sampleNum);
    end
    %update sigma
    for i=1:k
        sum_ = zeros(dim,dim);
        for j=1:sampleNum
            sum_ = sum_+ weight(j,i)*(sampleMatrix(j,:)-mu(i,:))'*(sampleMatrix(j,:)-mu(i,:));
        end
        sigma(i,:) = sum_/(phi(i)*sampleNum);
    end
end
iter
sigma = sqrt(sigma);
end


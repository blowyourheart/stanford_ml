%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% nb_train.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN');
trainMatrix = full(spmatrix);
numTrainDocs = size(trainMatrix, 1);
numTokens = size(trainMatrix, 2);
% ...
% YOUR CODE HERE
V = size(trainMatrix, 2);
neg = trainMatrix(find(trainCategory == 0), :);
pos = trainMatrix(find(trainCategory == 1), :);
neg_words = sum(sum(neg));
pos_words = sum(sum(pos));
neg_log_prior = log(size(neg,1) / numTrainDocs);
pos_log_prior = log(size(pos,1) / numTrainDocs);
% for k=1:V,
%     neg_log_phi(k) = log((sum(neg(:,k)) + 1) / (neg_words + V));
%     pos_log_phi(k) = log((sum(pos(:,k)) + 1) / (pos_words + V));
% end
alpha = 1;  % smooth weight
neg_log_phi = log((sum(neg) + alpha) / (neg_words + alpha * V));
pos_log_phi = log((sum(pos) + alpha) / (pos_words + alpha * V));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% nb_test.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[spmatrix, tokenlist, category] = readMatrix('MATRIX.TEST');
testMatrix = full(spmatrix);
numTestDocs = size(testMatrix, 1);
numTokens = size(testMatrix, 2);
% ...
output = zeros(numTestDocs, 1);
%---------------
% YOUR CODE HERE
for k=1:numTestDocs,
    [i,j,v] = find(testMatrix(k,:));
    neg_posterior = sum(v .* neg_log_phi(j)) + neg_log_prior;
    pos_posterior = sum(v .* pos_log_phi(j)) + pos_log_prior;
    if (neg_posterior > pos_posterior)
        output(k) = 0;
    else
        output(k) = 1;
    end
end
%---------------
% Compute the error on the test set
error=0;
for i=1:numTestDocs
    if (category(i) ~= output(i))
        error=error+1;
    end
end
%Print out the classification error on the test set
error/numTestDocs
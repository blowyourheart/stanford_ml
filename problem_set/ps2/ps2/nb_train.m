
[spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN');

trainMatrix = full(spmatrix);
numTrainDocs = size(trainMatrix, 1);
numTokens = size(trainMatrix, 2);
V = size(trainMatrix, 2);

Y = full(trainCategory);
prob_y = [0 0]';
prob_y(1) = sum(Y) / size(Y, 2);
prob_y(2) = 1 - prob_y(1);
prob_y = log(prob_y);


% split dataset via label
% pos = trainMatrix(find(trainCategory == 1), :);
% neg = trainMatrix(find(trainCategory == 0), :);
% prob_word = zeros(2, numTokens);
% 
% prob_word(1, :) = sum(pos);
% pos_words = sum(prob_word(1, :));
% prob_word(1, :) = log((prob_word(1, :) + 1) / (pos_words + numTokens));
% 
% prob_word(2, :) = sum(neg);
% neg_words = sum(prob_word(2, :));
% prob_word(2, :) = log((prob_word(2, :) + 1) / (neg_words + numTokens));

% this code compute prob not equal to reference answer
prob_word = zeros(2, numTokens);
total_words = [0 0]';
% count word frequency against category
for i = 1:numTrainDocs
    if Y(i) == 1
        prob_word(1, :) = prob_word(1, :) + trainMatrix(i, :);
        total_words(1) = total_words(1) + sum(trainMatrix(i, :));
    else
        prob_word(2, :) = prob_word(2, :) + trainMatrix(i, :);
        total_words(2) = total_words(2) + sum(trainMatrix(i, :));
    end
end

% use laplace smoothing
prob_word(1, :) = log((prob_word(1, :) + 1) / (total_words(1) + numTokens));
prob_word(2, :) = log((prob_word(2, :) + 1) / (total_words(2) + numTokens));

% trainMatrix is now a (numTrainDocs x numTokens) matrix.
% Each row represents a unique document (email).
% The j-th column of the row $i$ represents the number of times the j-th
% token appeared in email $i$. 

% tokenlist is a long string containing the list of all tokens (words).
% These tokens are easily known by position in the file TOKENS_LIST

% trainCategory is a (1 x numTrainDocs) vector containing the true 
% classifications for the documents just read in. The i-th entry gives the 
% correct class for the i-th email (which corresponds to the i-th row in 
% the document word matrix).

% Spam documents are indicated as class 1, and non-spam as class 0.
% Note that for the SVM, you would want to convert these to +1 and -1.


% YOUR CODE HERE

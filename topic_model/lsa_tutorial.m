% 一个lsa的小例子程序，详情见
% http://www.puffinwarellc.com/index.php/news-and-articles/articles/33-latent-semantic-analysis-tutorial.html?showall=1
% 几点感受：
% 1） 用word-by-doc矩阵算了以后，发现和网页中的结果中，U, V都是负的，即U = -U, V = -V，当然这样分解也是对的，负负得正。
% 分解完了以后，将U的第一列和V'的第一行扔掉了，因为它们是关于词的出现次数的分量，作者说如果对原始矩阵做归一化就可以不需要扔掉第一维
% 的数据，具体什么原因我还没有搞明白。不过看分解后的数据发现，第一维的所有数值都是负的，因此也觉得留下没有多少价值在里面。
%

load lsa.txt
[U,S,V] = svd(lsa, 'econ');
U(:,1:3)
S(1:3,1:3)
V(:,1:3)'
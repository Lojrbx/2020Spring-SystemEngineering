function [bool,m] = calc_m(X,thres)
% 根据X来计算是否为病态，若为病态，计算m
[~,D] = eig(X*X');
lambda = sort(diag(D),'ascend');% 从小到大排列特征值
S = sum(lambda);
n = size(X,1);
if lambda(1)< S*thres
    bool = 1;
    for i=1:size(X,1)
        if (sum(lambda(1:i))< S*thres)&&(sum(lambda(1:i+1))>S*thres)
            m = n-i;
        end
    end
else
    bool = 0;
    m = n;
end
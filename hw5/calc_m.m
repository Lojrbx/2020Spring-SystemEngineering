function [bool,m] = calc_m(X,thres)
% ����X�������Ƿ�Ϊ��̬����Ϊ��̬������m
[~,D] = eig(X*X');
lambda = sort(diag(D),'ascend');% ��С������������ֵ
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
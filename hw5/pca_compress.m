function [pcs, cprs_data, cprs_c] = pca_compress(data, rerr)

[N,n] = size(data);
X = zeros(N,n);

% 归一化
sigma_x = std(data,0,1);
bar_x = mean(data);
for i = 1:n
    X(:,i) = (data(:,i)-bar_x(i))/sigma_x(i);
end

% 协方差矩阵
corr_X = (X'*X);

% 求XX^T的特征值和特征向量，并排序
[V,D] = eig(corr_X);
lambda = sort(diag(D),'ascend'); % 特征值
[~,order] = sort(diag(D),'descend');
V = V(:,order);

% 根据相对误差界限rerr来判断降维后维数m
S = sum(lambda);
if lambda(1) < S*rerr
    m = n-1;
    for i=1:n
        if (sum(lambda(1:i))< S*rerr)&&(sum(lambda(1:i+1))>S*rerr)
            m = n-i;
        end
    end
else
    m = n;
end

% 得到主成分方向
pcs = V(:,1:m);
 
% 在主成分方向上投影，压缩数据
cprs_data = (pcs'*X')';% ([m,n]*[n,N])

% 储存原始数据的方差和均值
cprs_c = [sigma_x;bar_x];


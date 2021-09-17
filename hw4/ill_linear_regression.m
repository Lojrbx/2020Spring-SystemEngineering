function c_hat = ill_linear_regression(X,Y,m)
%  进行病态线性回归

% 把特征向量按从大到小排列，并取前n-m个,得到Qm矩阵
[V,D] = eig(X*X');
[~,order] = sort(diag(D),'descend');
V = V(:,order);
Qm = V(:,1:m);

% 求d_hat
Dm = D(order,order);
diag_m = Dm(1:m,1:m);
d_hat = inv(diag_m) * Qm' * X * Y';
% c_hat
c_hat = Qm*d_hat;

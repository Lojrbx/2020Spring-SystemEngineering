function c_hat = ill_linear_regression(X,Y,m)
%  ���в�̬���Իع�

% �������������Ӵ�С���У���ȡǰn-m��,�õ�Qm����
[V,D] = eig(X*X');
[~,order] = sort(diag(D),'descend');
V = V(:,order);
Qm = V(:,1:m);

% ��d_hat
Dm = D(order,order);
diag_m = Dm(1:m,1:m);
d_hat = inv(diag_m) * Qm' * X * Y';
% c_hat
c_hat = Qm*d_hat;

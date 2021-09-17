function linear_regression(Y,X,alpha)
n = size(X,1);
N = size(X,2);

Ones = ones(1,N);
X = [Ones;X];



% 判断是否为病态的情况
% 设定阈值为0.0005
[bool,m] = calc_m(X,0.0005);
if bool==1
    % 为病态
    disp(['为病态情况, m = ' num2str(m)]);
    beta_hat = ill_linear_regression(X,Y,m);
else
    % 不是病态
    A = X * X';
    B = X * Y';
    beta_hat = inv(A)*B;
end
% Display the outcome:
disp('Linear Regression Outcome: beta = ');
disp(num2str(beta_hat));

% F_test
F_test(X,Y,beta_hat,alpha);
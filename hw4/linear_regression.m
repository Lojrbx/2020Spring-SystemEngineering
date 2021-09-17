function linear_regression(Y,X,alpha)
n = size(X,1);
N = size(X,2);

Ones = ones(1,N);
X = [Ones;X];



% �ж��Ƿ�Ϊ��̬�����
% �趨��ֵΪ0.0005
[bool,m] = calc_m(X,0.0005);
if bool==1
    % Ϊ��̬
    disp(['Ϊ��̬���, m = ' num2str(m)]);
    beta_hat = ill_linear_regression(X,Y,m);
else
    % ���ǲ�̬
    A = X * X';
    B = X * Y';
    beta_hat = inv(A)*B;
end
% Display the outcome:
disp('Linear Regression Outcome: beta = ');
disp(num2str(beta_hat));

% F_test
F_test(X,Y,beta_hat,alpha);
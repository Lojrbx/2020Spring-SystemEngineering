function F_test(X,Y,beta_hat,alpha)
% F test
%   1. F_alpha
n = size(X,1);
N = size(X,2);
p = 1 - alpha;
v1 = n;
v2 = N - n -1;
F_a = finv(p,v1,v2);
%   2. F
Y_hat = beta_hat' * X ;
y_bar = mean(Y);
ESS = (Y_hat - y_bar) * (Y_hat - y_bar)';
RSS = (Y - Y_hat) * (Y - Y_hat)';
F = ((N - n - 1)*ESS) / (n * RSS);
if F > F_a
    disp(['F=' num2str(F) ', F_a=' num2str(F_a) ', F>F_a, ' 'X and Y have Linear relation.']);
    % Print Confidence Interval
    Z_a = abs(norminv(alpha/2));
    S_sigma = sqrt((Y-Y_hat)*(Y-Y_hat)' / (N- n -1));
    disp(['Half width of Confindence Interval:' num2str(Z_a*S_sigma)]);
    disp(['Confidence Interval: [y_hat-' num2str(Z_a*S_sigma) ',y_hat+' num2str(Z_a*S_sigma) ']']);
else
    disp(['F=' num2str(F) ', F_a=' num2str(F_a) ', F<F_a, ' 'X and Y dont have Linear relation.']);
end
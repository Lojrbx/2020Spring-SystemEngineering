function linear_regression1(data,alpha)
X = data(:,2);
Y = data(:,1);

% Average of X & Y
x_bar = mean(X);
y_bar = mean(Y);
% L_xy
L_xy = (X-x_bar)' * (Y-y_bar);
% L_xx
L_xx = (X-x_bar)' * (X-x_bar);
% b^
b_hat = L_xy / L_xx;
% a^
a_hat = y_bar - b_hat * x_bar;
% Print to screen
disp(['Linear Regression Outcome: y = ' num2str(b_hat) ' x + ' num2str(a_hat)]);

% F test
%   1. F_alpha
N = size(X,1);
p = 1 - alpha;
v1 = 1;
v2 = N - 2;
F_a = finv(p,v1,v2);
%   2. F
Y_hat = b_hat * X + a_hat;
ESS = (Y_hat - y_bar)' * (Y_hat - y_bar);
RSS = (Y - Y_hat)' * (Y - Y_hat);
F = ((N - 2)*ESS) / RSS;
if F > F_a
    disp(['F=' num2str(F) ', F_a=' num2str(F_a) ', F>F_a, ' 'X and Y have Linear relation.']);
    % Print Confidence Interval
    Z_a = abs(norminv(alpha/2));
    S_sigma = sqrt((Y-Y_hat)'*(Y-Y_hat) / (N-2));
    disp(['Half width of Confindence Interval:' num2str(Z_a*S_sigma)]);
    disp(['Confidence Interval: [y_hat-' num2str(Z_a*S_sigma) ',y_hat+' num2str(Z_a*S_sigma) ']']);
    % Show in picture
    x_fit = min(X):0.00001:max(X);
    y_fit = b_hat*x_fit + a_hat;
    y_cfivl_low = y_fit - Z_a*S_sigma;
    y_civl_up = y_fit + Z_a*S_sigma;
    figure('name','DATA&LinearFunction&ConfidenceInterval')
    h_fit = plot(x_fit,y_fit,'b-','LineWidth',2);
    hold on
    h_cfivl_low = plot(x_fit,y_cfivl_low,'b--');
    hold on
    plot(x_fit,y_civl_up,'b--');
    hold on
    h_data = plot(X,Y,'r*','MarkerSize',5,'LineWidth',2);
    hold on
    legend([h_data,h_fit,h_cfivl_low],'Data','Fit','95% Confidence Intervals');
else
    disp(['F=' num2str(F) ', F_a=' num2str(F_a) ', F<F_a, ' 'X and Y dont have Linear relation.']);
end
    



function [pcs, cprs_data, cprs_c] = pca_compress(data, rerr)

[N,n] = size(data);
X = zeros(N,n);

% ��һ��
sigma_x = std(data,0,1);
bar_x = mean(data);
for i = 1:n
    X(:,i) = (data(:,i)-bar_x(i))/sigma_x(i);
end

% Э�������
corr_X = (X'*X);

% ��XX^T������ֵ������������������
[V,D] = eig(corr_X);
lambda = sort(diag(D),'ascend'); % ����ֵ
[~,order] = sort(diag(D),'descend');
V = V(:,order);

% �������������rerr���жϽ�ά��ά��m
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

% �õ����ɷַ���
pcs = V(:,1:m);
 
% �����ɷַ�����ͶӰ��ѹ������
cprs_data = (pcs'*X')';% ([m,n]*[n,N])

% ����ԭʼ���ݵķ���;�ֵ
cprs_c = [sigma_x;bar_x];


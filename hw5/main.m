[data,~] = xlsread('counties.xlsx','counties','C1:P3115');
[Y,~] = xlsread('counties.xlsx','counties','Q1:Q3115');
disp("---------��̬�ع���----------");
linear_regression(Y',data',0.05);
disp("-----------PCA���----------");
[~,cprs_data,~] = pca_compress(data,0.2);
linear_regression(Y',cprs_data',0.05);
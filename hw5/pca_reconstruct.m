function recon_data = pca_reconstruct(pcs, cprs_data, cprs_c)
recon_data = cprs_data*pcs';

n = size(pcs,1);
for i = 1:n
    recon_data(:,i) = recon_data(:,i)*cprs_c(1,i);
    recon_data(:,i) = recon_data(:,i)+cprs_c(2,i);
end
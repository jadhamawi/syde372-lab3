function [mean_vec, cov_vec] = get_sample_statistics(full_dat, num_class)

%     class_dat = full_dat(:,full_dat(3,:)==class);
%     sample_mean = mean(class_dat(1:2,:)');
%     sample_cov = cov(class_dat(1:2,:)');
    
    mean_vec = [];
    cov_vec = [];
    
    for i = 1:num_class
        class_dat = full_dat(:,full_dat(3,:)==i);
        mean_vec = [mean_vec; mean(class_dat(1:2,:)')];
        cov_vec = [cov_vec; cov(class_dat(1:2,:)')];
    end

end
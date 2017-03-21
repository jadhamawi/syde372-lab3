function [error_matrix, labels] = get_error_matrix(test_dat, mean_vec, cov_vec)        
    
    error_matrix = zeros(10);
    labels = [];
    
    for i=1:length(test_dat)

        dist_a = sqrt( (test_dat(1:2,i)' - mean_vec(1)) * inv(cov_vec(1:2,:)) * (test_dat(1:2,i)' - mean_vec(1))' );
        dist_b = sqrt( (test_dat(1:2,i)' - mean_vec(2)) * inv(cov_vec(3:4,:)) * (test_dat(1:2,i)' - mean_vec(2))' );
        dist_c = sqrt( (test_dat(1:2,i)' - mean_vec(3)) * inv(cov_vec(5:6,:)) * (test_dat(1:2,i)' - mean_vec(3))' );
        dist_d = sqrt( (test_dat(1:2,i)' - mean_vec(4)) * inv(cov_vec(7:8,:)) * (test_dat(1:2,i)' - mean_vec(4))' );
        dist_e = sqrt( (test_dat(1:2,i)' - mean_vec(5)) * inv(cov_vec(9:10,:)) * (test_dat(1:2,i)' - mean_vec(5))' );
        dist_f = sqrt( (test_dat(1:2,i)' - mean_vec(6)) * inv(cov_vec(11:12,:)) * (test_dat(1:2,i)' - mean_vec(6))' );
        dist_g = sqrt( (test_dat(1:2,i)' - mean_vec(7)) * inv(cov_vec(13:14,:)) * (test_dat(1:2,i)' - mean_vec(7))' );
        dist_h = sqrt( (test_dat(1:2,i)' - mean_vec(8)) * inv(cov_vec(15:16,:)) * (test_dat(1:2,i)' - mean_vec(8))' );
        dist_i = sqrt( (test_dat(1:2,i)' - mean_vec(9)) * inv(cov_vec(17:18,:)) * (test_dat(1:2,i)' - mean_vec(9))' );
        dist_j = sqrt( (test_dat(1:2,i)' - mean_vec(10)) * inv(cov_vec(19:20,:)) * (test_dat(1:2,i)' - mean_vec(10))' );

        dist_vec = [dist_a, dist_b, dist_c, dist_d, dist_e, dist_f, dist_g, dist_h, dist_i, dist_j];

        true_class = test_dat(3,i);

        if max(dist_vec) == dist_a
            labels(i) = 1;          
        elseif max(dist_vec) == dist_b
            labels(i) = 2;
        elseif max(dist_vec) == dist_c
            labels(i) = 3;
        elseif max(dist_vec) == dist_d
            labels(i) = 4;
        elseif max(dist_vec) == dist_e
            labels(i) = 5;
        elseif max(dist_vec) == dist_f
            labels(i) = 6;
        elseif max(dist_vec) == dist_g
            labels(i) = 7;
        elseif max(dist_vec) == dist_h
            labels(i) = 8;
        elseif max(dist_vec) == dist_i
            labels(i) = 9;
        elseif max(dist_vec) == dist_j
            labels(i) = 10;
        end

        error_matrix(true_class, labels(i)) = error_matrix(true_class, labels(i)) + 1;
    end

end

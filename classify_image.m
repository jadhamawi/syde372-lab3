function labels = classify_image(test_dat, mean_vec, cov_vec)

    labels = zeros(size(test_dat,1));
    
    for i=1:size(test_dat,1)
        for j=1:size(test_dat,2)

            dist_a = sqrt( ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(1,:)) * inv(cov_vec(1:2,:)) * ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(1,:))' );
            dist_b = sqrt( ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(2,:)) * inv(cov_vec(3:4,:)) * ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(2,:))' );
            dist_c = sqrt( ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(3,:)) * inv(cov_vec(5:6,:)) * ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(3,:))' );
            dist_d = sqrt( ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(4,:)) * inv(cov_vec(7:8,:)) * ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(4,:))' );
            dist_e = sqrt( ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(5,:)) * inv(cov_vec(9:10,:)) * ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(5,:))' );
            dist_f = sqrt( ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(6,:)) * inv(cov_vec(11:12,:)) * ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(6,:))' );
            dist_g = sqrt( ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(7,:)) * inv(cov_vec(13:14,:)) * ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(7,:))' );
            dist_h = sqrt( ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(8,:)) * inv(cov_vec(15:16,:)) * ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(8,:))' );
            dist_i = sqrt( ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(9,:)) * inv(cov_vec(17:18,:)) * ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(9,:))' );
            dist_j = sqrt( ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(10,:)) * inv(cov_vec(19:20,:)) * ([test_dat(i,j,1) test_dat(i,j,2)] - mean_vec(10,:))' );

            dist_vec = [dist_a, dist_b, dist_c, dist_d, dist_e, dist_f, dist_g, dist_h, dist_i, dist_j];

            if min(dist_vec) == dist_a
                labels(i,j) = 1;          
            elseif min(dist_vec) == dist_b
                labels(i,j) = 2;
            elseif min(dist_vec) == dist_c
                labels(i,j) = 3;
            elseif min(dist_vec) == dist_d
                labels(i,j) = 4;
            elseif min(dist_vec) == dist_e
                labels(i,j) = 5;
            elseif min(dist_vec) == dist_f
                labels(i,j) = 6;
            elseif min(dist_vec) == dist_g
                labels(i,j) = 7;
            elseif min(dist_vec) == dist_h
                labels(i,j) = 8;
            elseif min(dist_vec) == dist_i
                labels(i,j) = 9;
            elseif min(dist_vec) == dist_j
                labels(i,j) = 10;
            end

        end
    end
    
end
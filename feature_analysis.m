% SYDE 372 Pattern Recognition
% Lab 3: Image Classification
% Jad Hamawi (20470773) and Melody Kuo (20466854)

%% Feature Analysis

image = readim('cloth.im'); 
imagesc(image);
colormap(gray);

load feat.mat;
aplot(f2);
xlabel('x1 - horizontal variation'),ylabel('x2 - vertical variation');

%% Labelled Classification

% Initialize grid
[x,y] = meshgrid(0:0.001:0.5);
xy = [x(:) y(:)];

dec_map = [];

% For each class, I need the mean and covariance...
% [dat_a_32, mean_a, cov_a] = get_sample_statistics(f32, 1);
% [dat_b_32, mean_b, cov_b] = get_sample_statistics(f32, 2);
% [dat_c_32, mean_c, cov_c] = get_sample_statistics(f32, 3);
% [dat_d_32, mean_d, cov_d] = get_sample_statistics(f32, 4);
% [dat_e_32, mean_e, cov_e] = get_sample_statistics(f32, 5);
% [dat_f_32, mean_f, cov_f] = get_sample_statistics(f32, 6);
% [dat_g_32, mean_g, cov_g] = get_sample_statistics(f32, 7);
% [dat_h_32, mean_h, cov_h] = get_sample_statistics(f32, 8);
% [dat_i_32, mean_i, cov_i] = get_sample_statistics(f32, 9);
% [dat_j_32, mean_j, cov_j] = get_sample_statistics(f32, 10);
% 
% mean_vec = [mean_a; mean_b; mean_c; mean_d; mean_e; mean_f; mean_g;
%                 mean_h; mean_i; mean_j];
% cov_vec = [cov_a; cov_b; cov_c; cov_d; cov_e; cov_f; cov_g;
%                 cov_h; cov_i; cov_j];

[f32_mean_vec, f32_cov_vec] = get_sample_statistics(f32,10);
[f8_mean_vec, f8_cov_vec] = get_sample_statistics(f8,10);
[f2_mean_vec, f2_cov_vec] = get_sample_statistics(f2,10);

%% MICD Decision Boundary
 
% for i=1:length(xy)
%     dist_a = sqrt( (xy(i,:) - mean_a) * inv(cov_a) * (xy(i,:) - mean_a)' );
%     dist_b = sqrt( (xy(i,:) - mean_b) * inv(cov_b) * (xy(i,:) - mean_b)' );
%     dist_c = sqrt( (xy(i,:) - mean_c) * inv(cov_c) * (xy(i,:) - mean_c)' );
%     dist_d = sqrt( (xy(i,:) - mean_d) * inv(cov_d) * (xy(i,:) - mean_d)' );
%     dist_e = sqrt( (xy(i,:) - mean_e) * inv(cov_e) * (xy(i,:) - mean_e)' );
%     dist_f = sqrt( (xy(i,:) - mean_f) * inv(cov_f) * (xy(i,:) - mean_f)' );
%     dist_g = sqrt( (xy(i,:) - mean_g) * inv(cov_g) * (xy(i,:) - mean_g)' );
%     dist_h = sqrt( (xy(i,:) - mean_h) * inv(cov_h) * (xy(i,:) - mean_h)' );
%     dist_i = sqrt( (xy(i,:) - mean_i) * inv(cov_i) * (xy(i,:) - mean_i)' );
%     dist_j = sqrt( (xy(i,:) - mean_j) * inv(cov_j) * (xy(i,:) - mean_j)' );
%     dist_vec = [dist_a, dist_b, dist_c, dist_d, dist_e, dist_f, dist_g, dist_h, dist_i, dist_j];
%     if max(dist_vec) == dist_a
%         dec_map(i) = 1;
%     elseif max(dist_vec) == dist_b
%         dec_map(i) = 2;
%     elseif max(dist_vec) == dist_c
%         dec_map(i) = 3;
%     elseif max(dist_vec) == dist_d
%         dec_map(i) = 4;
%     elseif max(dist_vec) == dist_e
%         dec_map(i) = 5;
%     elseif max(dist_vec) == dist_f
%         dec_map(i) = 6;
%     elseif max(dist_vec) == dist_g
%         dec_map(i) = 7;
%     elseif max(dist_vec) == dist_h
%         dec_map(i) = 8;
%     elseif max(dist_vec) == dist_i
%         dec_map(i) = 9;
%     elseif max(dist_vec) == dist_j
%         dec_map(i) = 10;
%     end
%         
% end
% 
% figure, contour(reshape(dec_map,[501,501]),10,'Color','green','LineWidth',1);


%% Classify test points

[f32t_error_matrix, f32t_labels] = get_error_matrix(f32t, f32_mean_vec, f32_cov_vec);
[f8t_error_matrix, f8t_labels] = get_error_matrix(f8t, f8_mean_vec, f8_cov_vec);
[f2t_error_matrix, f2t_labels] = get_error_matrix(f2t, f2_mean_vec, f2_cov_vec);

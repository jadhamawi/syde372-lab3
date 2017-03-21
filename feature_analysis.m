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

[f32_mean_vec, f32_cov_vec] = get_sample_statistics(f32,10);
[f8_mean_vec, f8_cov_vec] = get_sample_statistics(f8,10);
[f2_mean_vec, f2_cov_vec] = get_sample_statistics(f2,10);

%% MICD Decision Boundary
%  
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


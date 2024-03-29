% SYDE 372 Pattern Recognition
% Lab 3: Image Classification
% Jad Hamawi (20470773) and Melody Kuo (20466854)

%% Feature Analysis

image = readim('cloth.im'); 
imagesc(image);

load feat.mat;
aplot(f32);
xlabel('x1 - horizontal variation'),ylabel('x2 - vertical variation');

%% Labelled Classification

[f32_mean_vec, f32_cov_vec] = get_sample_statistics(f32,10);
[f8_mean_vec, f8_cov_vec] = get_sample_statistics(f8,10);
[f2_mean_vec, f2_cov_vec] = get_sample_statistics(f2,10);


%% Classify test points

[f32t_error_matrix, f32t_labels] = get_error_matrix(f32t, f32_mean_vec, f32_cov_vec);
[f8t_error_matrix, f8t_labels] = get_error_matrix(f8t, f8_mean_vec, f8_cov_vec);
[f2t_error_matrix, f2t_labels] = get_error_matrix(f2t, f2_mean_vec, f2_cov_vec);

%% Classify each pixel in multf8
pixel_classes = classify_image(multf8, f8_mean_vec, f8_cov_vec);

%% Plot segmentation results
imagesc(pixel_classes)
colorbar
axis('off')

%% Unlabelled clustering

K=10;

[centroids, labels, prototypes] = unlabelled_clustering(f32, K);

figure, aplot(f32);

hold on
scatter(centroids(:,1),centroids(:,2),50,'filled');
xlabel('x1'),ylabel('x2')
title('labelled kmeans results');

%% using built-in algorithm with initialization as custom kmeans (validation)

dat = f32(1:2,:)';
[idx, C] = kmeans(dat,10, 'start', prototypes)
figure, scatter(dat(:,1),dat(:,2))
hold on
scatter(C(:,1),C(:,2),50,'filled')
xlabel('x1'),ylabel('x2')
title('Using built-in kmeans');

%% fuzzy k-means

% [centers, u, obj_fun] = fcm(dat,10);
% figure, scatter(dat(:,1),dat(:,2))
% hold on
% scatter(centers(:,1),centers(:,2),50,'filled')
% title('Fuzzy c-means clustering')



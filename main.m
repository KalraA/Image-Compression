%  Load the image
A = double(imread('bird_small.png'));

A = A / 255; % Divide all the values of the image so that they are in the range of 0 and 1.

%we have to know the size of the image we are working on.
img_size = size(A);

%now we have to format it into a 3xnum_pixels matrix
X = reshape(A, img_size(1) * img_size(2), 3);

% K is the number of clusters, or in this case the number of images.
K = 11; 
%number of iterations we want our algo to do
its = 14;

%randomly intializing the centroids of K-means
initial_centroids = kMeansInitCentroids(X, K);

% Run K-Means
[centroids, idx] = runkMeans(X, initial_centroids, its);


% Tell each pixel to find it's closest centroid.
idx = findClosestCentroids(X, centroids);

%Now we just take each centroid's data and map it to the original pixel 
newImage = centroids(idx,:);
%Normalize the features
[X_norm, mu, sigma] = featureNormalize(newImage);

%  Run PCA
[U, S] = pca(X_norm);

L = 1;
Z = projectData(X_norm, U, L);
X_rec  = recoverData(Z, U, L);
% Reshape the recovered images into proper dimensions
newImage = reshape(newImage, img_size(1), img_size(2), 3);
bwImage = reshape(X_rec, img_size(1), img_size(2), 3);

% Display Images side by side 
subplot(1, 3, 1);
imagesc(A); 
title('Original');
subplot(1, 3, 2);
imagesc(newImage);
title('Reduced to 16 colors')
subplot(1, 3, 3);
imagesc(bwImage);
title('Turned Black and White')
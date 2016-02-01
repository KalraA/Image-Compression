function [centroids, idx] = runkMeans(X, initial_centroids, ...
                                      max_iters, plot_progress)

[m n] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
idx = zeros(m, 1);

% The K-means algorithm
for i=1:max_iters
    
    idx = findClosestCentroids(X, centroids);
    
    centroids = computeCentroids(X, idx, K);
end
end


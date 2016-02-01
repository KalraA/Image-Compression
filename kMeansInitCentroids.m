function centroids = kMeansInitCentroids(X, K)

%Randomly initializing the ceontroids
randidx = randperm(size(X, 1));
centroids = X(randidx(1:K), :);

end


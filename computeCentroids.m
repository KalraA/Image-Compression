function centroids = computeCentroids(X, idx, K)

[m n] = size(X);

centroids = zeros(K, n);

%Find the new location for each centroid
for i = 1:K
	sel = find(idx==i);
	centroids (i, :) = mean(X(sel, :));
end

end


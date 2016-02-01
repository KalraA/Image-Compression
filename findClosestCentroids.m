function idx = findClosestCentroids(X, centroids)

% Set K
K = size(centroids, 1);
%index values
idx = zeros(size(X,1), 1);


a = [];
for i = 1:K
	c = [];
	for j = 1:size(centroids, 2)
		c = [c, X(:, j) .- centroids(i, j)];
	end
	b = sum(c .^ 2, 2);	
	a = [a, b];
end
a;
[z, y] = min(a, [], 2);
idx = y;

end


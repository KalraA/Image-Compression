function [U, S] = pca(X)

[m, n] = size(X);

sigma = X'*X ./m;
[U, S, V] = svd(sigma);

end

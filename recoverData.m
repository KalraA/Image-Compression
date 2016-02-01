function X_rec = recoverData(Z, U, K)

X_rec = zeros(size(Z, 1), size(U, 1));

Ured = U(:, 1:K);
X_rec = Z*Ured';

end

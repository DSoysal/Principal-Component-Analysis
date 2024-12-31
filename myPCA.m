function [d, V, A] = myPCA(X)
    % myPCA: Perform Principal Component Analysis (PCA)
    
    meanX = mean(X, 2);
    X_centered = X - meanX;     

    C = (X_centered * X_centered') / (size(X, 2) - 1); % Covariance matrix

    [V, D] = eig(C); % V: Eigenvectors, D: Diagonal matrix of eigenvalues
    
    d = diag(D); % Eigenvalues as a column vector
    
    [d, idx] = sort(d, 'descend'); % Sort 
    V = V(:, idx); % Reorder eigenvectors accordingly

    A = V' * X_centered; % Project data onto the principal components
    X_reconstructed = meanX + V * A; % Reconstruct the data using PCA
    reconstruction_error = norm(X - X_reconstructed, 'fro');
    fprintf('Reconstruction error: %.2e\n', reconstruction_error);
    assert(reconstruction_error < 1e-8, 'Reconstruction failed!');
end

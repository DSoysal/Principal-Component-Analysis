function Xhat = myPCAdimreductor(X, Kprime)
    % myPCAdimreductor: Perform PCA-based dimensionality reduction and reconstruction
    
    meanX = mean(X, 2);
    X_centered = X - meanX;

    % Perform PCA
    [d, V, A] = myPCA(X);
    
    V_Kprime = V(:, 1:Kprime);    % Select the top Kprime eigenvectors
    A_Kprime = A(1:Kprime, :);    % Select the top Kprime rows of the coefficients matrix
    
    % Step 5: Reconstruct the dataset
    Xhat = meanX + V_Kprime * A_Kprime;
end

% Assume V is the matrix of eigenvectors obtained from myPCA
figure;

for i = 1:3
    % Reshape the i-th eigenvector into a 28x28 grid and transpose for visualization
    eigenvector_image = reshape(V(:, i), 28, 28)';

    % Create subplot for each eigenvector
    subplot(1, 3, i);
    imshow(eigenvector_image, []);
    title(['Eigenvector ', num2str(i)]);
end

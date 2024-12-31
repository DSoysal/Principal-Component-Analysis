% Load MNIST data
load('mnist.mat'); % Assume this loads X and labels

n = randi(size(X, 2)); % Random index
xn = X(:, n); % Randomly selected vector

Kprime_values = [2, 10, 50, 100, 250, 784];

figure;
num_plots = length(Kprime_values);
for i = 1:num_plots
    Kprime = Kprime_values(i);
    
    % Reconstruct
    Xhat = myPCAdimreductor(X, Kprime);
    xhat_n = Xhat(:, n);
    
    % Calculate reconstruction error
    reconstruction_error = norm(xn - xhat_n);
    
    % Reshape to 28x28 for visualization
    xhat_image = reshape(xhat_n, 28, 28)';
    
    % Plot
    subplot(1, num_plots, i);
    imshow(xhat_image, [], 'InitialMagnification', 'fit');
    title(sprintf('K'' = %d\nError = %.2f', Kprime, reconstruction_error));
end

% Overall title
sgtitle('PCA Reconstruction for Different K'' Values');

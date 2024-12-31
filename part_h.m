close all

load('mnist.mat'); 

% Generate noisy dataset
N = size(X, 2); 
noise = randi([0, 256], size(X)); 
Y = X + noise; 

% Randomly sample three indices
indices = randi(N, 1, 3); 
yn_samples = Y(:, indices); 

% K' value
Kprime = 100;

% Apply PCA
Yhat = myPCAdimreductor(Y, Kprime);

figure;
for i = 1:3
    yn = yn_samples(:, i);
    yhat_n = Yhat(:, indices(i));
    
    % Reshape 
    yn_image = reshape(yn, 28, 28)';
    yhat_image = reshape(yhat_n, 28, 28)';
    
    % Plot 
    subplot(3, 2, 2*i-1);
    imshow(yn_image, [], 'InitialMagnification', 'fit');
    title(sprintf('Noisy Sample %d', i));
    
    subplot(3, 2, 2*i);
    imshow(yhat_image, [], 'InitialMagnification', 'fit');
    title(sprintf('Reduced Sample %d\nK'' = %d', i, Kprime));
end

sgtitle(sprintf('Noisy Vectors and Reduced Versions (K'' = %d)', Kprime));

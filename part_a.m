close all

load('mnist.mat');

num_samples = 9;
random_indices = randperm(size(X, 2), num_samples);

% Create a 3x3 grid of subplots
figure;
for i = 1:num_samples
 
    idx = random_indices(i);
    img = reshape(X(:, idx), [28, 28]);
    img = img';
    
    % Display the image
    subplot(3, 3, i);
    imshow(img, []); 

    title(['Digit: ', num2str(labels(idx))]);
end
load('mnist.mat');

% Generate the noisy dataset Y
[N, K] = size(X);
W = 256 * rand(N, K); 
Y = X + W;


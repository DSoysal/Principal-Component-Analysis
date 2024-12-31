close all

% Load the MNIST dataset (Assuming X and labels are loaded)
load('mnist.mat'); % X: 784x70000, labels: 1x70000

% Perform PCA
[d, V, A] = myPCA(X);

% Filter indices for digits 0, 1, and 8
indices_0 = find(labels == 0);
indices_1 = find(labels == 1);
indices_8 = find(labels == 8);

% Extract first two rows of A for these digits
A_0 = A(1:2, indices_0);
A_1 = A(1:2, indices_1);
A_8 = A(1:2, indices_8);

% Plot scatter plots
figure;
hold on;
scatter(A_0(1, :), A_0(2, :), 10, 'r', 'filled', 'DisplayName', 'Digit 0');
scatter(A_1(1, :), A_1(2, :), 10, 'b', 'filled', 'DisplayName', 'Digit 1');
scatter(A_8(1, :), A_8(2, :), 10, 'g', 'filled', 'DisplayName', 'Digit 8');
xlabel('PCA Basis 1 (a_1)');
ylabel('PCA Basis 2 (a_2)');
title('Scatter Plot of Digits 0, 1, and 8 in PCA Frame');
legend('show');
axis equal;
grid on;
hold off;

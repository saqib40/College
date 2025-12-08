% EXPERIMENT 3: Spatial Domain Filtering (Smoothing & Sharpening)
% ---------------------------------------------------------------
clc; clear; close all;

% --- 1. SETUP ---
img = imread('peppers.png');
gray_img = rgb2gray(img); 

% We need to convert to 'double' for math. 
% If we stick to 'uint8', negative values (in Laplacian) get clipped to 0.
img_d = im2double(gray_img); 

% Add Noise (to test our Smoothing filters)
% 'salt & pepper' is black/white dots. 'gaussian' is general fuzz.
noisy_img = imnoise(img_d, 'salt & pepper', 0.05);

% --- PART 1: SMOOTHING FILTERS (Blurring) ---
figure('Name', 'Smoothing Filters (Noise Removal)', 'NumberTitle', 'off');

% A. Noisy Input
subplot(2,2,1); imshow(noisy_img); title('1. Noisy Image (Salt & Pepper)');

% B. Average Filter (Box Filter)
% Concept: Replace pixel with average of its neighbors.
% Kernel: A 3x3 matrix where every value is 1/9.
h_avg = fspecial('average', [3 3]); 
avg_filtered = imfilter(noisy_img, h_avg);
subplot(2,2,2); imshow(avg_filtered); title('2. Average Filter (3x3)');

% C. Gaussian Filter
% Concept: Weighted average. Center pixel matters most, neighbors matter less.
% Better at preserving image structure than Average filter.
h_gauss = fspecial('gaussian', [3 3], 1.0); % Sigma = 1.0
gauss_filtered = imfilter(noisy_img, h_gauss);
subplot(2,2,3); imshow(gauss_filtered); title('3. Gaussian Filter');

% D. Median Filter (The "Salt & Pepper" Killer)
% Concept: Sort neighbors and pick the middle value. 
% This is non-linear and PERFECT for removing outliers (white/black dots).
median_filtered = medfilt2(noisy_img, [3 3]);
subplot(2,2,4); imshow(median_filtered); title('4. Median Filter');


% --- PART 2: SHARPENING FILTERS (Edge Enhancement) ---
figure('Name', 'Sharpening Filters', 'NumberTitle', 'off');

% A. Original
subplot(2,3,1); imshow(img_d); title('1. Original');

% B. Laplacian Filter (Edge Detection)
% Concept: Calculates the 2nd Derivative (rate of change of change).
% It produces 0 in flat areas, and high numbers at edges.
% Manual Kernel: Center is 4, Neighbors are -1. 
h_lap = [0 -1 0; -1 4 -1; 0 -1 0]; 
lap_filtered = imfilter(img_d, h_lap);

% IMPORTANT: We use [] in imshow to scale negative values to displayable range
subplot(2,3,2); imshow(lap_filtered, []); title('2. Laplacian Edges');

% C. Composite Sharpening (Image + Edges)
% We add the edges back to the original image to make it look sharper.
sharpened_img = img_d + lap_filtered;
subplot(2,3,3); imshow(sharpened_img); title('3. Sharpened (Img + Lap)');

% D. High-Boost Filtering
% Concept: Original + (A * Edges). We amplify the edges by factor 'A'.
A = 2; 
high_boost = img_d + (A * lap_filtered);
subplot(2,3,4); imshow(high_boost); title(['4. High Boost (A=', num2str(A), ')']);

% E. Sobel (Gradient Operator) - Horizontal
% Detects vertical edges (changes as you move horizontally)
h_sobel = fspecial('sobel'); 
sobel_img = imfilter(img_d, h_sobel);
subplot(2,3,5); imshow(sobel_img, []); title('5. Sobel (Horizontal)');

% F. Prewitt (Gradient Operator)
h_prewitt = fspecial('prewitt');
prewitt_img = imfilter(img_d, h_prewitt);
subplot(2,3,6); imshow(prewitt_img, []); title('6. Prewitt');
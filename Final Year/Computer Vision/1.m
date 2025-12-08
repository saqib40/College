% EXPERIMENT 1: Basic Image Handling & Processing
% ------------------------------------------------
clc; clear; close all; % Clear command window, workspace, and figures

% --- 1. IMAGE READING ---
% We use a built-in MATLAB sample image so this code runs everywhere.
img = imread('peppers.png'); 

% Print Info to Command Window
[rows, cols, channels] = size(img);
fprintf('Image Loaded: %d x %d pixels with %d channels (RGB)\n', rows, cols, channels);

% --- 2. GEOMETRIC MANIPULATIONS (Visualized in Figure 1) ---
figure('Name', 'Geometric Manipulations', 'NumberTitle', 'off');

% A. Original Image
subplot(2, 3, 1); % Create a grid of 2 rows, 3 columns, activate slot 1
imshow(img);
title('1. Original');

% B. Grayscale Conversion
% Converts 3D array (RGB) to 2D array (Intensity)
gray_img = rgb2gray(img);
subplot(2, 3, 2);
imshow(gray_img);
title('2. Grayscale');

% C. Resizing
% 0.5 scales the image to 50% of original height and width
resized_img = imresize(img, 0.5); 
subplot(2, 3, 3);
imshow(resized_img);
title('3. Resized (50%)');

% D. Rotation
% 45 degrees counter-clockwise. 
rotated_img = imrotate(img, 45); 
subplot(2, 3, 4);
imshow(rotated_img);
title('4. Rotated 45°');

% E. Flipping
% flipud = Flip Up-Down (Vertical). fliplr = Flip Left-Right (Horizontal).
flipped_img = flipud(img); 
subplot(2, 3, 5);
imshow(flipped_img);
title('5. Vertically Flipped');

% F. Cropping
% Syntax: image(Rows_Start:Rows_End, Cols_Start:Cols_End, Channels)
% The ':' in the 3rd spot means "keep all RGB colors"
cropped_img = img(50:200, 100:300, :); 
subplot(2, 3, 6);
imshow(cropped_img);
title('6. Cropped Region');


% --- 3. ENHANCEMENT & ANALYSIS (Visualized in Figure 2) ---
figure('Name', 'Analysis and Filtering', 'NumberTitle', 'off');

% A. Histogram
% Shows the distribution of pixel intensities (0 to 255)
subplot(2, 2, 1);
imhist(gray_img); 
title('1. Histogram (Grayscale)');

% B. Brightness Adjustment (Gamma Correction)
% Gamma < 1 makes image brighter. Gamma > 1 makes it darker/contrastier.
% Your original code used 1.5, which actually darkens mid-tones. 
% I changed it to 0.6 so you clearly see it get BRIGHTER.
bright_img = imadjust(gray_img, [], [], 0.6); 
subplot(2, 2, 2);
imshow(bright_img);
title('2. Brightness Increased (Gamma=0.6)');

% C. Gaussian Filtering (Blur)
% This removes noise but blurs edges. '2' is the Sigma (strength).
filtered_img = imgaussfilt(gray_img, 2); 
subplot(2, 2, 3);
imshow(filtered_img);
title('3. Gaussian Blur (Sigma=2)');

% --- 4. SAVING ---
imwrite(gray_img, 'processed_image.jpg');
disp('Success: Grayscale image saved to current folder.');
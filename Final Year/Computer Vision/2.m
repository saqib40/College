% EXPERIMENT 2: Point Operations & Histogram Processing
% -----------------------------------------------------
clc; clear; close all;

% --- 1. SETUP ---
img = imread('peppers.png');
% Convert to grayscale (Processing intensity is easier than processing Color)
gray_img = rgb2gray(img); 

% Define a figure window
figure('Name', 'Point Operations & Histograms', 'NumberTitle', 'off', 'Position', [100, 100, 1400, 600]);

% --- COLUMN 1: ORIGINAL ---
subplot(2,4,1); imshow(gray_img); title('1. Original');
subplot(2,4,5); imhist(gray_img); title('Hist: Original');

% --- COLUMN 2: IMAGE NEGATIVE ---
% Formula: Output = (L-1) - Input. For uint8, L=256, so 255 - Input.
% Useful for analyzing white details on black backgrounds (like Mammograms)
negative_img = 255 - gray_img; 

subplot(2,4,2); imshow(negative_img); title('2. Negative');
subplot(2,4,6); imhist(negative_img); title('Hist: Negative');

% --- COLUMN 3: CONTRAST STRETCHING (Linear) ---
% Goal: Stretch the narrow range of pixels to cover the full 0-255 range.
% Formula: New = (Old - Min) * (255 / (Max - Min))

% Convert to double for math precision (uint8 truncates decimals)
img_double = double(gray_img); 
min_val = min(img_double(:));
max_val = max(img_double(:));

% Apply Formula
stretched_double = 255 * (img_double - min_val) / (max_val - min_val);
stretched_img = uint8(stretched_double); % Convert back to image format

subplot(2,4,3); imshow(stretched_img); title('3. Contrast Stretched');
subplot(2,4,7); imhist(stretched_img); title('Hist: Stretched');

% --- COLUMN 4: HISTOGRAM EQUALIZATION (Non-Linear) ---
% Goal: Flatten the histogram so every gray level is equally likely.
% This maximizes contrast statistically.
equalized_img = histeq(gray_img);

subplot(2,4,4); imshow(equalized_img); title('4. Hist Equalization');
subplot(2,4,8); imhist(equalized_img); title('Hist: Equalized');
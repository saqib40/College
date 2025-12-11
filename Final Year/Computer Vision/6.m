% EXPERIMENT 6: Image Restoration (Noise vs. Filters)
% ---------------------------------------------------
clc; clear; close all;

% 1. SETUP
img = imread('peppers.png');
gray_img = rgb2gray(img);

% --- SCENARIO 1: GAUSSIAN NOISE (The "Fuzzy" Problem) ---
figure('Name', 'Scenario 1: Gaussian Noise', 'NumberTitle', 'off');

% Step A: Add Gaussian Noise (Mean=0, Variance=0.02)
noise_gauss = imnoise(gray_img, 'gaussian', 0, 0.02);
subplot(1, 3, 1); imshow(noise_gauss); title('1. Gaussian Noise (Fuzzy)');

% Step B: The Solution (Mean/Average Filter)
% Averages the random +/- variations towards 0.
% Works well, but blurs the image details.
restored_mean = imfilter(noise_gauss, fspecial('average', [3 3]));
subplot(1, 3, 2); imshow(restored_mean); title('2. Mean Filter (Good)');

% Step C: The Alternative (Median Filter)
% Works okay, but often leaves the image looking "painted" or patchy.
restored_median_g = medfilt2(noise_gauss, [3 3]);
subplot(1, 3, 3); imshow(restored_median_g); title('3. Median Filter (Okay)');


% --- SCENARIO 2: SALT & PEPPER NOISE (The "Broken Pixel" Problem) ---
figure('Name', 'Scenario 2: Salt & Pepper Noise', 'NumberTitle', 'off');

% Step A: Add Salt & Pepper Noise (5% of pixels)
noise_sp = imnoise(gray_img, 'salt & pepper', 0.05);
subplot(1, 3, 1); imshow(noise_sp); title('1. Salt & Pepper (Dots)');

% Step B: The Failure (Mean Filter)
% BAD IDEA. It takes the white dot (255) and averages it with neighbors.
% Result: The crisp white dot becomes a muddy gray smear.
fail_mean = imfilter(noise_sp, fspecial('average', [3 3]));
subplot(1, 3, 2); imshow(fail_mean); title('2. Mean Filter (FAIL - Smears)');

% Step C: The Solution (Median Filter)
% PERFECT. It sorts the pixels [10, 10, 12, 255, 10]. 
% The middle value is 10. The 255 is purely deleted.
restored_median_sp = medfilt2(noise_sp, [3 3]);
subplot(1, 3, 3); imshow(restored_median_sp); title('3. Median Filter (Perfect)');
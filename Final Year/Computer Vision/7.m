% EXPERIMENT 7: Edge Detection (Sobel vs. Canny)
% ----------------------------------------------
clc; clear; close all;

% 1. SETUP
img = imread('cameraman.tif'); % Good because it has sharp lines
% Convert to double for calculation (0.0 to 1.0)
img = im2double(img);

figure('Name', 'Edge Detection Comparison', 'NumberTitle', 'off');

% --- PART A: THE BASICS (Sobel) ---
subplot(2, 3, 1); imshow(img); title('1. Original');

% 1. Calculate Gradient (The "Slope")
% This shows HOW fast pixels change.
[Gx, Gy] = imgradientxy(img, 'sobel');
gradient_mag = sqrt(Gx.^2 + Gy.^2);

subplot(2, 3, 2); imshow(gradient_mag, []); title('2. Sobel Gradient (No Threshold)');

% 2. Apply Threshold (The Decision)
% "If slope > 0.4, it is an edge."
binary_sobel = gradient_mag > 0.4;
subplot(2, 3, 3); imshow(binary_sobel); title('3. Sobel Binary (Thresh=0.4)');


% --- PART B: THE WINNER (Canny) ---
% Canny does 3 extra steps:
% 1. Gauss Blur (remove noise)
% 2. Non-Max Suppression (thin lines to 1 pixel)
% 3. Hysteresis (connect weak edges to strong edges)

% Let's see Sobel vs Prewitt vs Canny using the built-in function
subplot(2, 3, 4); 
imshow(edge(img, 'sobel')); title('4. Sobel (Built-in)');

subplot(2, 3, 5); 
imshow(edge(img, 'prewitt')); title('5. Prewitt (Built-in)');

subplot(2, 3, 6); 
imshow(edge(img, 'canny')); title('6. Canny (The Best)');
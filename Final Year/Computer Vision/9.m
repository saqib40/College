% EXPERIMENT 9: Color Model Conversion & Enhancement
% --------------------------------------------------
clc; clear; close all;

% 1. SETUP
img_rgb = im2double(imread('peppers.png')); % Load as double (0.0 - 1.0)

figure('Name', 'Color Space Enhancement', 'NumberTitle', 'off');

% --- PART A: HSV (Hue, Saturation, Value) ---
% Best for: "Make the colors pop" or "Shift colors"
img_hsv = rgb2hsv(img_rgb);
H = img_hsv(:,:,1); % Color
S = img_hsv(:,:,2); % Purity
V = img_hsv(:,:,3); % Brightness

% Enhancement: Boost Saturation by 50%
S_enhanced = S * 1.5; 
S_enhanced(S_enhanced > 1) = 1; % Clamp to max 1.0

% Reconstruct
img_hsv_enhanced = hsv2rgb(cat(3, H, S_enhanced, V));

% --- PART B: YCbCr (Luminance, Chrominance) ---
% Best for: "Fixing lighting" without ruining color
img_ycbcr = rgb2ycbcr(img_rgb);
Y = img_ycbcr(:,:,1);  % Luminance (Brightness only)
Cb = img_ycbcr(:,:,2); % Blue Chroma
Cr = img_ycbcr(:,:,3); % Red Chroma

% Enhancement: Histogram Equalization on Y only
% This fixes contrast without shifting the colors (unlike RGB histeq)
Y_enhanced = adapthisteq(Y); 

% Reconstruct
img_ycbcr_enhanced = ycbcr2rgb(cat(3, Y_enhanced, Cb, Cr));

% --- PART C: VISUALIZATION ---
% 1. Original
subplot(2,3,1); imshow(img_rgb); title('1. Original RGB');

% 2. HSV Results
subplot(2,3,2); imshow(S); title('2. Original Saturation Map');
subplot(2,3,3); imshow(img_hsv_enhanced); title('3. HSV Enhanced (Sat +50%)');

% 3. YCbCr Results
subplot(2,3,5); imshow(Y); title('4. Original Luminance (Y)');
subplot(2,3,6); imshow(img_ycbcr_enhanced); title('5. YCbCr Enhanced (Contrast)');
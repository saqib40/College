% EXPERIMENT 9: Color Model Conversion & Enhancement
clc; clear; close all;

rgb = im2double(imread('peppers.png'));
figure('Name','Color Model Conversion');

%% ---- HSV ENHANCEMENT ----
hsv = rgb2hsv(rgb);
hsv(:,:,2) = min(hsv(:,:,2)*1.5,1);   % Boost Saturation
hsv_enh = hsv2rgb(hsv);

%% ---- YCbCr ENHANCEMENT ----
ycbcr = rgb2ycbcr(rgb);
ycbcr(:,:,1) = adapthisteq(ycbcr(:,:,1)); % Enhance Luminance
ycbcr_enh = ycbcr2rgb(ycbcr);

%% ---- DISPLAY ----
subplot(2,3,1), imshow(rgb), title('Original RGB');
subplot(2,3,2), imshow(hsv(:,:,2)), title('Saturation (HSV)');
subplot(2,3,3), imshow(hsv_enh), title('HSV Enhanced');

subplot(2,3,5), imshow(ycbcr(:,:,1)), title('Luminance Y');
subplot(2,3,6), imshow(ycbcr_enh), title('YCbCr Enhanced');

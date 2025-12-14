% EXPERIMENT 6: Image Restoration
clc; clear; close all;

img = rgb2gray(imread('peppers.png'));

%% ---- GAUSSIAN NOISE ----
figure('Name','Gaussian Noise Restoration');

g_noise = imnoise(img,'gaussian',0,0.02);
subplot(1,3,1), imshow(g_noise), title('Gaussian Noise');

subplot(1,3,2)
imshow(imfilter(g_noise,fspecial('average',[3 3]))),
title('Mean Filter');

subplot(1,3,3)
imshow(medfilt2(g_noise,[3 3])),
title('Median Filter');

%% ---- SALT & PEPPER NOISE ----
figure('Name','Salt & Pepper Noise Restoration');

sp_noise = imnoise(img,'salt & pepper',0.05);
subplot(1,3,1), imshow(sp_noise), title('Salt & Pepper');

subplot(1,3,2)
imshow(imfilter(sp_noise,fspecial('average',[3 3]))),
title('Mean Filter');

subplot(1,3,3)
imshow(medfilt2(sp_noise,[3 3])),
title('Median Filter');

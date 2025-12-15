% EXPERIMENT 3: Spatial Domain Filtering
% Implement spatial domain filtering techniques such as image smoothing
% and sharpening using average, Gaussian, and Laplacian filters. 

clc; clear; close all;

% Read & preprocess image
img = im2double(rgb2gray(imread('peppers.png')));
noisy = imnoise(img,'salt & pepper',0.05);

%% ---- SMOOTHING FILTERS ----
figure('Name','Smoothing Filters');

subplot(2,2,1), imshow(noisy), title('Noisy Image');

subplot(2,2,2)
imshow(imfilter(noisy, fspecial('average',[3 3]))),
title('Average Filter');

subplot(2,2,3)
imshow(imfilter(noisy, fspecial('gaussian',[3 3],1))),
title('Gaussian Filter');

subplot(2,2,4)
imshow(medfilt2(noisy,[3 3])),
title('Median Filter');

%% ---- SHARPENING FILTERS ----
figure('Name','Sharpening Filters');

lap = imfilter(img,[0 -1 0; -1 4 -1; 0 -1 0]);

subplot(2,3,1), imshow(img), title('Original');
subplot(2,3,2), imshow(lap,[]), title('Laplacian');
subplot(2,3,3), imshow(img + lap), title('Sharpened');

A = 2;
subplot(2,3,4), imshow(img + A*lap), title('High Boost');

subplot(2,3,5)
imshow(imfilter(img,fspecial('sobel')),[]),
title('Sobel');

subplot(2,3,6)
imshow(imfilter(img,fspecial('prewitt')),[]),
title('Prewitt');
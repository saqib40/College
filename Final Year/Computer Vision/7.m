% EXPERIMENT 7: Edge Detection & Thresholding
clc; clear; close all;

img = im2double(imread('cameraman.tif'));
figure('Name','Edge Detection');

%% ---- SOBEL WITH GLOBAL THRESHOLDING ----
[Gx,Gy] = imgradientxy(img,'sobel');
Gmag = sqrt(Gx.^2 + Gy.^2);
T = 0.4;                       % Global threshold
sobel_thresh = Gmag > T;

subplot(2,3,1), imshow(img), title('Original');
subplot(2,3,2), imshow(Gmag,[]), title('Sobel Gradient');
subplot(2,3,3), imshow(sobel_thresh), title('Sobel + Threshold');

%% ---- BUILT-IN EDGE DETECTORS ----
subplot(2,3,4), imshow(edge(img,'sobel')), title('Sobel');
subplot(2,3,5), imshow(edge(img,'prewitt')), title('Prewitt');
subplot(2,3,6), imshow(edge(img,'canny')), title('Canny');

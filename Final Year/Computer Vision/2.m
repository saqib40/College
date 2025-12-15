% EXPERIMENT 2: Point Operations & Histogram Processing
% To perform Point Operations and Histogram Processing including image negative, contrast stretching,
% and histogram equalization 

clc; clear; close all;

img = rgb2gray(imread('peppers.png'));
figure('Name','Point Operations & Histograms');

%% ---- ORIGINAL ----
subplot(2,4,1), imshow(img), title('Original');
subplot(2,4,5), imhist(img), title('Hist');

%% ---- IMAGE NEGATIVE ----
neg = 255 - img;
subplot(2,4,2), imshow(neg), title('Negative');
subplot(2,4,6), imhist(neg), title('Hist');

%% ---- CONTRAST STRETCHING ----
d = double(img);
min = min(d(:));
max = max(d(:));
cs = uint8(255*(d-min)/(max-min));
subplot(2,4,3), imshow(cs), title('Contrast Stretch');
subplot(2,4,7), imhist(cs), title('Hist');

%% ---- HISTOGRAM EQUALIZATION ----
he = histeq(img);
subplot(2,4,4), imshow(he), title('Hist Equalization');
subplot(2,4,8), imhist(he), title('Hist');

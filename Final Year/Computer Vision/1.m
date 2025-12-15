% EXPERIMENT 1: Basic Image Handling
% To perform basic Image Handling and processing operations
% on the image. Image Reading, Displaying, and Basic Manipulations. 

clc; clear; close all;

%% ---- IMAGE READING ----
img = imread('peppers.png');
fprintf('Image size: %d x %d x %d\n', size(img));

%% ---- BASIC MANIPULATIONS ----
figure('Name','Basic Image Operations');

gray = rgb2gray(img);

subplot(2,3,1), imshow(img), title('Original');
subplot(2,3,2), imshow(gray), title('Grayscale');
subplot(2,3,3), imshow(imresize(img,0.5)), title('Resized');
subplot(2,3,4), imshow(imrotate(img,45)), title('Rotated');
subplot(2,3,5), imshow(flipud(img)), title('Flipped');
subplot(2,3,6), imshow(img(50:200,100:300,:)), title('Cropped');

%% ---- ANALYSIS & ENHANCEMENT ----
figure('Name','Analysis');

subplot(2,2,1), imhist(gray), title('Histogram');
subplot(2,2,2), imshow(imadjust(gray,[],[],0.6)), title('Brightness');
subplot(2,2,3), imshow(imgaussfilt(gray,2)), title('Gaussian Blur');

%% ---- SAVE RESULT ----
imwrite(gray,'processed_image.jpg');

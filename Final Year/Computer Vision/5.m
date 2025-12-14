% EXPERIMENT 5: Frequency Domain Analysis using DFT
clc; clear; close all;

img = im2double(rgb2gray(imread('peppers.png')));
figure('Name','Frequency Domain Analysis');

%% Spatial Domain
subplot(1,3,1), imshow(img), title('Spatial Domain');

%% Frequency Domain (DFT)
F = fftshift(fft2(img));
mag = log(1 + abs(F));
phase = angle(F);

subplot(1,3,2)
imshow(mag,[]), colormap jet, colorbar
title('Magnitude Spectrum');

subplot(1,3,3)
imshow(phase,[]), colormap gray
title('Phase Spectrum');

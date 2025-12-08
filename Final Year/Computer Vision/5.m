% EXPERIMENT 5: Frequency Domain Analysis (DFT)
% ---------------------------------------------
clc; clear; close all;

% 1. SETUP
img = imread('peppers.png');
gray_img = double(rgb2gray(img)); % Must be double for FFT math

figure('Name', 'Frequency Domain Analysis', 'NumberTitle', 'off');

% --- PART A: SPATIAL DOMAIN ---
subplot(1, 3, 1);
imshow(uint8(gray_img));
title('1. Spatial Domain (Pixels)');

% --- PART B: FREQUENCY DOMAIN (DFT) ---
% fft2: Computes Discrete Fourier Transform
% fftshift: Moves the "Zero Frequency" (DC) from top-left corner to Center
F = fftshift(fft2(gray_img));

% 1. MAGNITUDE SPECTRUM (How MUCH of each frequency?)
% The center dot is huge (millions) vs high frequencies (small). 
% We use log(1 + x) to compress the range so we can see details.
magnitude = log(1 + abs(F));

subplot(1, 3, 2);
imshow(magnitude, []); % [] scales min/max to black/white
colormap(gca, 'jet');  % 'Jet' makes bright spots red/yellow (easier to see)
colorbar;
title('2. Magnitude (Log Scale)');

% 2. PHASE SPECTRUM (WHERE are the frequencies?)
% Contains the structural info (edges/shapes). Looks like noise to humans.
phase = angle(F);

subplot(1, 3, 3);
imshow(phase, []); 
colormap(gca, 'gray');
title('3. Phase Spectrum');
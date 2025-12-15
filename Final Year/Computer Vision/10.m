% EXPERIMENT 10: 
% To perform Color-based Segmentation. Segment images based on color thresholds in HSV space

clc; clear; close all;

rgb = imread('peppers.png');
hsv = rgb2hsv(rgb);
H = hsv(:,:,1); S = hsv(:,:,2);

figure('Name','HSV Color Segmentation');

%% ---- COLOR MASKS ----
redMask    = ((H<0.1 | H>0.9) & S>0.4);
greenMask  = (H>0.25 & H<0.45 & S>0.4);
yellowMask = (H>0.12 & H<0.22 & S>0.4);

se = strel('disk',3);
redMask = imopen(redMask,se);
greenMask = imopen(greenMask,se);
yellowMask = imopen(yellowMask,se);

%% ---- DISPLAY ----
subplot(2,3,1), imshow(rgb), title('Original RGB');
subplot(2,3,2), imshow(H), title('Hue Channel');

subplot(2,3,4)
imshow(rgb .* uint8(cat(3,redMask,redMask,redMask))),
title('Red Objects');

subplot(2,3,5)
imshow(rgb .* uint8(cat(3,greenMask,greenMask,greenMask))),
title('Green Objects');

subplot(2,3,6)
imshow(rgb .* uint8(cat(3,yellowMask,yellowMask,yellowMask))),
title('Yellow Objects');

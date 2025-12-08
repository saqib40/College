% EXPERIMENT 4: Geometric Transformations (Scaling, Rotation, Translation)
% ------------------------------------------------------------------------
clc; clear; close all;

% 1. SETUP
img = imread('peppers.png');
figure('Name', 'Geometric Transformations', 'NumberTitle', 'off');

% --- PART A: THE "EASY" WAY (Built-in Functions) ---
subplot(2,3,1); imshow(img); title('Original');

% Scaling (Resizing)
% '0.5' is the scale factor.
subplot(2,3,2); imshow(imresize(img, 0.5)); title('Scaled (0.5x)');

% Rotation
% '45' degrees. 'crop' keeps original size (cuts corners).
subplot(2,3,3); imshow(imrotate(img, 45, 'crop')); title('Rotated (45 deg)');

% Translation (Shifting)
% 'circshift' wraps pixels around. [y_shift, x_shift, channels]
subplot(2,3,4); imshow(circshift(img, [50, 80, 0])); title('Translated (circshift)');


% --- PART B: THE "MATH" WAY (Affine Matrices) ---
% This is the core of Computer Vision logic. We build a matrix T.
% MATLAB convention: [a b 0; c d 0; tx ty 1]

% Define Parameters
theta = deg2rad(30); % 30 degrees rotation
sx = 0.8; sy = 0.8;  % 0.8x scaling
tx = 50;  ty = 30;   % Translation pixels

% 1. Create the Transformation Matrix (Combined: Rotate -> Scale -> Translate)
% T = [ Scale*Cos   -Scale*Sin    0
%       Scale*Sin    Scale*Cos    0
%       Trans_X      Trans_Y      1 ]
T_matrix = [ sx*cos(theta)  -sx*sin(theta)   0;
             sx*sin(theta)   sx*cos(theta)   0;
             tx              ty              1 ];

% 2. Create Object and Apply
tform = affine2d(T_matrix);
warped_img = imwarp(img, tform);

subplot(2,3,5); imshow(warped_img); title('Combined Affine Matrix');

% 3. Visualization of what "Affine" means
% It preserves parallel lines but not necessarily angles/lengths
shear_matrix = [1 0.5 0; 0 1 0; 0 0 1];
shear_img = imwarp(img, affine2d(shear_matrix));
subplot(2,3,6); imshow(shear_img); title('Shear Transform');
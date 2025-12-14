% EXPERIMENT 4: Geometric Transformations
clc; clear; close all;

img = imread('peppers.png');
figure('Name','Geometric Transformations');

%% ---- BUILT-IN METHODS ----
subplot(2,3,1), imshow(img), title('Original');
subplot(2,3,2), imshow(imresize(img,0.5)), title('Scaling');
subplot(2,3,3), imshow(imrotate(img,45,'crop')), title('Rotation');
subplot(2,3,4), imshow(circshift(img,[50 80 0])), title('Translation');

%% ---- AFFINE TRANSFORMATION ----
theta = deg2rad(30);
sx = 0.8; tx = 50; ty = 30;

T = [ sx*cos(theta) -sx*sin(theta) 0;
      sx*sin(theta)  sx*cos(theta) 0;
      tx             ty            1 ];

aff_img = imwarp(img, affine2d(T));
subplot(2,3,5), imshow(aff_img), title('Affine Transform');

%% ---- SHEAR TRANSFORMATION ----
shear = [1 0.5 0; 0 1 0; 0 0 1];
subplot(2,3,6), imshow(imwarp(img,affine2d(shear))), title('Shear');

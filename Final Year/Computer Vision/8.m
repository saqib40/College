% EXPERIMENT 8: Region Based Segmentation
clc; clear; close all;

img = im2double(imread('cameraman.tif'));
figure, subplot(2,2,1), imshow(img), title('Original');

%% REGION GROWING (Seed + Threshold)
mask = grayconnected(img,100,100,0.15);
subplot(2,2,2), imshow(mask), title('Region Growing');

%% SPLIT & MERGE (Quadtree)
S = qtdecomp(img,0.2);
subplot(2,2,3), imshow(full(S)>0), title('Split');

out = imresize(blockproc(img,[8 8],@(b)mean(b.data(:))),size(img));
subplot(2,2,4), imshow(out), title('Split & Merge');

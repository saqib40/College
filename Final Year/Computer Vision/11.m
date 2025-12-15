% EXPERIMENT 11: Morphological Operations
% To Perform morphological operations including erosion, dilation,
% opening, closing, and hit-or-miss transformation for shape-based processing. 

clc; clear; close all;

img = imread('text.png');      % Binary text image
figure('Name','Morphological Operations');

se = strel('line',11,90);      % Structuring element (vertical)

%% ---- BASIC OPERATIONS ----
subplot(2,3,1), imshow(img), title('Original');

subplot(2,3,2)
imshow(imerode(img,se)), title('Erosion');

subplot(2,3,3)
imshow(imdilate(img,se)), title('Dilation');

subplot(2,3,4)
imshow(imopen(img,strel('disk',1))), title('Opening');

broken = img; 
broken(50:60,50:60)=0;
subplot(2,3,5)
imshow(imclose(broken,strel('disk',5))), title('Closing');

%% ---- HIT-OR-MISS TRANSFORMATION ----
figure('Name','Hit-or-Miss');

bin = zeros(10);                 % Synthetic image
bin(2:4,2:4)=1;                  % Square
bin(6:8,7)=1; bin(7,6:8)=1;      % Cross

pattern = [0 1 0; 1 1 1; 0 1 0];
hitmiss = bwhitmiss(bin,pattern);

subplot(1,3,1), imshow(bin,'InitialMagnification','fit'), title('Input');
subplot(1,3,2), imshow(hitmiss,'InitialMagnification','fit'), title('Hit-or-Miss');
subplot(1,3,3), imshow(imfuse(bin,hitmiss)), title('Overlay');

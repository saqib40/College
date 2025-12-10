% EXPERIMENT 10: Color-Based Segmentation (HSV)
% ---------------------------------------------
clc; clear; close all;

% 1. SETUP
img = imread('peppers.png');
img_hsv = rgb2hsv(img);

% Extract Channels
H = img_hsv(:,:,1); % Hue (Color Type)
S = img_hsv(:,:,2); % Saturation (Color Purity)
V = img_hsv(:,:,3); % Value (Brightness)

figure('Name', 'Color Segmentation', 'NumberTitle', 'off');

% --- PART A: DEFINE MASKS (The Logic) ---

% 1. RED MASK (Tricky!)
% Red is at the start (0.0-0.1) AND the end (0.9-1.0) of the circle.
% We also check Saturation > 0.4 so we don't pick up gray/white pixels.
mask_red = ((H <= 0.1) | (H >= 0.9)) & (S > 0.4);

% 2. GREEN MASK (Approx 0.25 - 0.45)
mask_green = (H >= 0.25) & (H <= 0.45) & (S > 0.4);

% 3. YELLOW MASK (Approx 0.12 - 0.22)
mask_yellow = (H >= 0.12) & (H <= 0.22) & (S > 0.4);

% --- PART B: CLEANUP (Morphology) ---
% Remove small "noise" dots using 'imopen' (Erosion -> Dilation)
se = strel('disk', 3);
mask_red = imopen(mask_red, se);
mask_green = imopen(mask_green, se);
mask_yellow = imopen(mask_yellow, se);

% --- PART C: VISUALIZATION ---
% Row 1: The Input
subplot(2,3,1); imshow(img); title('1. Original RGB');
subplot(2,3,2); imshow(H); title('2. Hue Channel (Gray=Color)');

% Row 2: The Segmented Output
% We use the mask to "black out" everything that isn't our color.
% We must replicate the mask to 3 channels (cat) to multiply with RGB.

% Red Objects
red_obj = img .* uint8(cat(3, mask_red, mask_red, mask_red));
subplot(2,3,4); imshow(red_obj); title('3. Segmented Red');

% Green Objects
green_obj = img .* uint8(cat(3, mask_green, mask_green, mask_green));
subplot(2,3,5); imshow(green_obj); title('4. Segmented Green');

% Yellow Objects
yellow_obj = img .* uint8(cat(3, mask_yellow, mask_yellow, mask_yellow));
subplot(2,3,6); imshow(yellow_obj); title('5. Segmented Yellow');
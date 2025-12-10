% EXPERIMENT 11: Morphological Operations
% ---------------------------------------
clc; clear; close all;

% --- PART 1: THE BASICS (Real Image) ---
% We use 'text.png' (built-in) because morphology is best seen on text/shapes
img = imread('text.png'); 
figure('Name', 'Morphological Operations', 'NumberTitle', 'off');

% 1. Original Binary Image
subplot(2,3,1); imshow(img); title('1. Original');

% Define the "Brush" (Structuring Element)
se = strel('line', 11, 90); % A vertical line of length 11

% 2. EROSION (Shrink)
% Logic: "Does the WHOLE line fit here?"
% Result: Vertical letters (i, l, t) survive. Horizontal parts disappear.
eroded = imerode(img, se);
subplot(2,3,2); imshow(eroded); title('2. Erosion (Vertical Line)');

% 3. DILATION (Grow)
% Result: Letters become thick and merge together.
dilated = imdilate(img, se);
subplot(2,3,3); imshow(dilated); title('3. Dilation');

% 4. OPENING (Erosion -> Dilation)
% Logic: "Remove small noise, keep big shapes."
% Result: If we use a Disk, it removes jagged edges but keeps letters.
se_disk = strel('disk', 1);
opened = imopen(img, se_disk);
subplot(2,3,4); imshow(opened); title('4. Opening (Remove Noise)');

% 5. CLOSING (Dilation -> Erosion)
% Logic: "Fill small holes, keep big shapes."
% We create a "broken" image to test this.
broken_img = img; 
broken_img(50:60, 50:60) = 0; % Add a black hole
closed = imclose(broken_img, strel('disk', 5));
subplot(2,3,5); imshow(closed); title('5. Closing (Fill Holes)');


% --- PART 2: HIT-OR-MISS (Pattern Matching) ---
% This looks for an EXACT shape. Let's make a simple example.
figure('Name', 'Hit-or-Miss Transform', 'NumberTitle', 'off');

% Create a synthetic image with 3 shapes: Square, Cross, Dot
synth_img = zeros(10, 10);
synth_img(2:4, 2:4) = 1;      % A 3x3 Square
synth_img(6:8, 7) = 1;        % A Vertical line
synth_img(7, 6:8) = 1;        % A Horizontal line (Making a Cross)

subplot(1,3,1); imshow(synth_img, 'InitialMagnification', 'fit'); 
title('1. Synthetic Shapes');

% We want to find ONLY the Cross.
% Hit: The pixels we WANT (a cross shape)
interval = [0 1 0; 1 1 1; 0 1 0]; 
% Miss: The pixels we DON'T WANT (the corners must be empty)
% If we don't define this, it might find a cross *inside* the square.
hitmiss = bwhitmiss(synth_img, interval);

subplot(1,3,2); imshow(hitmiss, 'InitialMagnification', 'fit'); 
title('2. Detected Cross Location');

% Visualize Overlay
subplot(1,3,3); imshow(imfuse(synth_img, hitmiss)); 
title('3. Overlay');
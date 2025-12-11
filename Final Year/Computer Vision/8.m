% EXPERIMENT 8: Region-Based Segmentation
% ---------------------------------------
clc; clear; close all;

% 1. SETUP
img = imread('cameraman.tif');
% Resize for speed (Recursive algorithms are slow on big images)
img = imresize(img, 0.5); 
img_double = im2double(img);

figure('Name', 'Region Based Segmentation', 'NumberTitle', 'off');

% --- PART 1: REGION GROWING (The "Forest Fire") ---
subplot(2,2,1); imshow(img); title('1. Original (Click a Seed Point)');

% A. User Input
disp('Click on a point in the image to start Region Growing...');
[y, x] = ginput(1); % User clicks on the image
seed_val = img_double(round(x), round(y)); 

% B. The Algorithm
% Logic: Find all pixels connected to the seed that are within a threshold
threshold = 0.15; % Tolerance (15% difference allowed)
region_mask = false(size(img)); % Binary mask
queue = [round(x), round(y)];   % To-Do List of pixels

% While we have pixels to process...
while ~isempty(queue)
    % Pop the first pixel
    curr = queue(1, :);
    queue(1, :) = [];
    
    r = curr(1); c = curr(2);
    
    % Check bounds and if already visited
    if r>0 && c>0 && r<=size(img,1) && c<=size(img,2) && ~region_mask(r,c)
        % Check Similarity
        if abs(img_double(r,c) - seed_val) < threshold
            region_mask(r,c) = true; % Mark as part of region
            
            % Add 4 neighbors to queue
            queue = [queue; r+1, c; r-1, c; r, c+1; r, c-1];
        end
    end
end

subplot(2,2,2); imshow(region_mask); title('2. Region Growing Result');


% --- PART 2: SPLIT AND MERGE (The "Quadtree") ---
% We use MATLAB's built-in 'qtdecomp' (Quadtree Decomposition).
% It splits blocks if the difference (max - min) > threshold.

split_threshold = 0.2; % If block range > 0.2, split it
min_dim = 4;           % Don't split smaller than 4x4 pixels

% A. Perform Splitting
% S is a sparse matrix showing where the blocks are
S = qtdecomp(img_double, split_threshold, min_dim);

% B. Visualize the Blocks
% 'full' converts sparse matrix to normal so we can see it
blocks_viz = full(S); 
blocks_viz(blocks_viz > 0) = 1; % Make lines visible

subplot(2,2,3); imshow(blocks_viz); title('3. Quadtree Splitting');

% C. "Merge" (Fill blocks with mean value)
% We iterate through the Quadtree blocks and fill them with their average color.
merged_img = zeros(size(img));
block_sizes = unique(nonzeros(S)); % Get all block sizes (e.g., 32, 16, 8, 4)

for k = 1:length(block_sizes)
    dim = block_sizes(k);
    [vals, r, c] = qtgetblk(img_double, S, dim); % Get all blocks of this size
    
    % For each block, calculate mean and fill
    for i = 1:length(r)
        block_mean = mean(mean(vals(:,:,i)));
        merged_img(r(i):r(i)+dim-1, c(i):c(i)+dim-1) = block_mean;
    end
end

subplot(2,2,4); imshow(merged_img); title('4. Split & Merge Result');
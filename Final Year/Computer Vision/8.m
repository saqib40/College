% EXPERIMENT 8: Region Based Segmentation
clc; clear; close all;

img = im2double(imresize(imread('cameraman.tif'),0.5));
figure('Name','Region Based Segmentation');

%% ---- REGION GROWING ----
subplot(2,2,1), imshow(img), title('Original (Select Seed)');
[x,y] = ginput(1);
seed = img(round(y),round(x));
T = 0.15;

mask = false(size(img));
Q = [round(y) round(x)];

while ~isempty(Q)
    p = Q(1,:); Q(1,:)=[];
    r=p(1); c=p(2);
    if r>0 && c>0 && r<=size(img,1) && c<=size(img,2) && ~mask(r,c)
        if abs(img(r,c)-seed) < T
            mask(r,c)=1;
            Q = [Q; r+1 c; r-1 c; r c+1; r c-1];
        end
    end
end

subplot(2,2,2), imshow(mask), title('Region Growing');

%% ---- SPLIT & MERGE (QUADTREE) ----
S = qtdecomp(img,0.2,4);
viz = full(S); viz(viz>0)=1;
subplot(2,2,3), imshow(viz), title('Quadtree Split');

out = zeros(size(img));
dims = unique(nonzeros(S));
for d = dims'
    [v,r,c] = qtgetblk(img,S,d);
    for i=1:length(r)
        out(r(i):r(i)+d-1,c(i):c(i)+d-1) = mean(v(:,:,i),'all');
    end
end

subplot(2,2,4), imshow(out), title('Split & Merge');

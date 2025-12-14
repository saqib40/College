% EXPERIMENT 12: Shape Features + Minimum Distance Classifier
clc; clear; close all;

%% ---- PREPROCESSING ----
img = imread('shapes.png');          % Binary shapes image
bw  = imcomplement(imbinarize(rgb2gray(img)));
bw  = bwareaopen(bw,100);

%% ---- FEATURE EXTRACTION ----
[L,n] = bwlabel(bw);
stats = regionprops(L,'Area','Perimeter','Eccentricity','BoundingBox');

feat = zeros(n,3);   % [Compactness, Eccentricity, Aspect Ratio]
for i = 1:n
    A = stats(i).Area;  P = stats(i).Perimeter;
    feat(i,1) = (P^2)/(4*pi*A);                % Compactness
    feat(i,2) = stats(i).Eccentricity;
    bb = stats(i).BoundingBox;
    feat(i,3) = bb(3)/bb(4);                   % Aspect Ratio
end

%% ---- TRAINING LABELS (Example) ----
% 1 = Circle, 2 = Triangle, 3 = Square
labels = [1 2 3];

%% ---- MINIMUM DISTANCE CLASSIFIER ----
pred = zeros(n,1);
for i = 1:n
    d = vecnorm(feat - feat(i,:),2,2);
    [~,idx] = min(d);
    pred(i) = labels(idx);
end

acc = mean(pred==labels')*100;
fprintf('Accuracy = %.2f%%\n',acc);

%% ---- VISUALIZATION ----
figure, imshow(img), title('Detected Shapes');
hold on;
for i = 1:n
    rectangle('Position',stats(i).BoundingBox,'EdgeColor','g','LineWidth',2);
    text(stats(i).BoundingBox(1),stats(i).BoundingBox(2)-10,...
        sprintf('Class %d',pred(i)),'Color','r','FontWeight','bold');
end
hold off;

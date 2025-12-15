% EXPERIMENT 12: Shape Classification
clc; clear; close all;

bw = imbinarize(rgb2gray(imread('shapes.png')));
bw = bwareaopen(imcomplement(bw),100);

[L,n] = bwlabel(bw);
s = regionprops(L,'Area','Perimeter','Eccentricity','BoundingBox');

for i = 1:n
    f(i,1) = (s(i).Perimeter^2)/(4*pi*s(i).Area); % Compactness
    f(i,2) = s(i).Eccentricity;
    f(i,3) = s(i).BoundingBox(3)/s(i).BoundingBox(4);
end

labels = [1 2 3];                     % Circle, Triangle, Square

for i = 1:n
    [~,c(i)] = min(sum((f - f(i,:)).^2,2));
end

imshow(imread('shapes.png')), hold on
for i = 1:n
    rectangle('Position',s(i).BoundingBox,'EdgeColor','g');
    text(s(i).BoundingBox(1),s(i).BoundingBox(2)-5,...
        num2str(labels(c(i))),'Color','r');
end
hold off

% Image Zooming using Interpolation Techniques
% when zooming a low-resolution grayscale image back to a higher resolution.

clear all; close all; clc;

% Read the original color image
OriginalImage = imread('flower.jpg');

% Convert the image to grayscale
grayImage = im2gray(OriginalImage);

% Downsample the grayscale image to 25% of its original size
lowResImage = imresize(grayImage, 0.25);  % Approx. 128 × 128 since the original was 512 × 512

% Display the low-resolution image
figure;
imshow(lowResImage);
title('Low-Resolution Image (128 × 128)');

% Interpolation Technique 1: Nearest Neighbor
nearestInterp = imresize(lowResImage, [512, 512], 'nearest');
figure;
imshow(nearestInterp);
title('Zoomed Image using Nearest Neighbor Interpolation (512 × 512)');

% Interpolation Technique 2: Bilinear
bilinearInterp = imresize(lowResImage, [512, 512], 'bilinear');
figure;
imshow(bilinearInterp);
title('Zoomed Image using Bilinear Interpolation (512 × 512)');

% Interpolation Technique 3: Bicubic
bicubicInterp = imresize(lowResImage, [512, 512], 'bicubic');
figure;
imshow(bicubicInterp);
title('Zoomed Image using Bicubic Interpolation (512 × 512)');

figure
montage({nearestInterp, bilinearInterp, bicubicInterp}, 'Size', [1, 3]);
title('Zoomed to 512 × 512: Nearest (Left) | Bilinear (Center) | Bicubic (Right)');

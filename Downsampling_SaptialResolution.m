% MATLAB Program: Downsampling and Spatial Resolution
% by progressively downsampling a grayscale image using various sampling factors.

clear all;
close all;
clc;

OriginalImage = imread('lemon.jpg');  %Read image information
grayImage = rgb2gray(OriginalImage); %Converts RGB Color Image to Grayscale Image

% Define the sampling factors for downsampling
factor = [2 4 8 16 32];


figure
montage({OriginalImage, grayImage}, 'Size', [1,2]);
title('Original RGB and Grayscale Images');

figure
% Display the original grayscale image
subplot(231);
imshow(grayImage);
title('Original image 512 x 512' ); 
% Downsample by a factor of 2 (every 2nd pixel)
downSampled1 = grayImage(1:factor(1):end, 1:factor(1):end);
subplot(232);
imshow(downSampled1);
title('Down Sampled image 256 x 256' ); 
% Downsample by a factor of 4
downSampled2 = grayImage(1:factor(2):end, 1:factor(2):end);
subplot(233);
imshow(downSampled2);
title('Down Sampled image 128 x 128' ); 

% Downsample by a factor of 8
downSampled3 = grayImage(1:factor(3):end, 1:factor(3):end);
subplot(234);
imshow(downSampled3);
title('Down Sampled image 64 x 64' ); 

% Downsample by a factor of 16
downSampled4 = grayImage(1:factor(4):end, 1:factor(4):end);
subplot(235);
imshow(downSampled4);
title('Down Sampled image 32 x 32' ); 

% Downsample by a factor of 32
downsampled5 = grayImage(1:factor(5):end, 1:factor(5):end);
subplot(236);
imshow(downsampled5);
title('Down Sampled image 16 x 16' );





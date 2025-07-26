% Contrast Stretching in MATLAB
% This code demonstrates contrast stretching on a grayscale image.
% The input image is brightened artificially before applying contrast enhancement.

clear all;
close all;
clc;

% Read and convert input image to grayscale
OriginalImage = imread('woman.jpg');
GrayImage = rgb2gray(OriginalImage);

% Artificially brighten the image for demonstration
AddedImage = imadd(GrayImage, 100); % Making the image brighter to use.

% Stretch contrast by remapping pixel values from input range to [0.01, 0.99]
StretchedImage = imadjust(AddedImage, stretchlim(AddedImage), [0.01, 0.99]);

%figure
montage({AddedImage, StretchedImage}, 'size', [1,2]);
title('Original Image (Left) | Contrast Strech Image (Right)');
  
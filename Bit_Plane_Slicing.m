%% Bit Plane Slicing in MATLAB
% This script extracts all 8 bit-planes from a grayscale image
% and reconstructs the image using the 4 most significant bit planes.

clear all;
close all;
clc;

%% Image Input and Preprocessing
originalImage = imread('woman.jpg');
grayImage = rgb2gray(originalImage); % Read and convert RGB image to grayscale


%I = rgb2gray(imread('nuj.jpg'));  
% Optional: Check value and binary of a specific pixel
selectedPixel = originalImage(80, 230);
selectedpixel_binary = dec2bin(selectedPixel);  % Display binary value (for visualization/debug)

%% Bit Plane Extraction and Display
% bitget() fetches the nth bit of each pixel in the image

subplot(3,3,1); imshow(originalImage); title('Original Image');

for k = 1:8
    bitPlane = bitget(grayImage, k);  % Get bit-plane k (1 = LSB, 8 = MSB)
    subplot(3,3,k+1);
    imshow(logical(bitPlane));
    title(['Bitplane ', num2str(k)]);
end

%% Bit Plane Combination: Reconstructing Using Top 4 Bits (MSBs)
% Start with a zero image of the same size
reconstructedImage = zeros(size(originalImage));

% Set the 5th to 8th bit-planes (most significant bits)
reconstructedImage = bitset(reconstructedImage, 8, bitget(originalImage, 8));
reconstructedImage = bitset(reconstructedImage, 7, bitget(originalImage, 7));
reconstructedImage = bitset(reconstructedImage, 6, bitget(originalImage, 6));
reconstructedImage = bitset(reconstructedImage, 5, bitget(originalImage, 5));

% Convert result to uint8 for proper image display
reconstructedImage = uint8(reconstructedImage);

%% Final Output Display
figure;
montage({grayImage, reconstructedImage}, 'Size', [1, 2]);
title('Original Image (Left) | Reconstructed with 4 MSBs (Right)');

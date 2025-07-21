% MATLAB program on Gray-Level/Intensity Resolution (Quantization)

clear all;
close all;
clc;

OriginalImage = imread('lemon.jpg');            % Reading input image
grayImage = rgb2gray(OriginalImage);               % Converting RGB image to Grayscale

[r, c, s] = size(grayImage);           % Getting Rows, Columns and Plane number
m = max(max(max(grayImage)));          % Getting maximum pixel value in the image

bits = [1:8];              % Bit levels for quantization (from 1 to 8)
                                   % For 8-bit, total levels = 2^8 = 256

figure
for i = 1:length(bits)
    d = 2^i;                       % Compute quantization step (divisor)
    quanImage = round(grayImage / d);         % Reduce intensity levels by dividing pixel values

    subplot(2, 4, i);             % Subplot arrangement for displaying 8 images
    imshow(quanImage * d);                 % Reconstruct image after quantization
    title(['Image using bit ', num2str(abs(i - 9))]); % Bit label (8 to 1 bit)
    hold on;
end

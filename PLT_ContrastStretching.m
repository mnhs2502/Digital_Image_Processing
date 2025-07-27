% Piecewise Linear Transformation (Contrast Stretching)
% Slope segments used: 0.5 (low), 2 (mid), 0.5 (high)
% This script performs contrast enhancement using piecewise linear transformation
% and plots the transformation curve.

clear all;
close all;
clc;

%% Read and prepare image
OriginalImage = imread('woman.jpg');
GrayImage = rgb2gray(OriginalImage);
doubleImage = im2double(GrayImage);
doubleImage_modified = (doubleImage*2) / max(doubleImage(:));

%% Initialize output image
StretchedImage = 0;
[row, col] = size(GrayImage);

%% Define thresholds
LT = 100; %The lower threshold value
UT = 150; %The upper threshold value
grid on;

%% Apply piecewise linear transformation

for i = 1:row
    for j = 1:col
        if doubleImage_modified(i,j) <= LT
            StretchedImage(i,j) = 0.5*doubleImage_modified(i,j);
        else if doubleImage_modified(i,j) <= UT
                StretchedImage(i,j) = 2* (doubleImage_modified(i,j)-LT) + (0.5*LT);
            else 
                StretchedImage(i,j) = 0.5 *(doubleImage_modified(i,j)-UT) + 0.5*LT+2*(UT-LT);
            end
        end
    end
end

%% Plot the piecewise transformation function
curve = [];
hold on;
curve(1:100) = 0.5 * (0:99);
curve (101:150) = 2*((100:149)-100) + 0.5*100;
curve(151:256) = (0.5*((150:255) - 150)) + (0.5*100) + (2*(150-100));
axis tight;
plot(curve, 'LineWidth', 2);
xlabel('Input Intensity');
ylabel('Output Intensity');
title('Piecewise Linear Contrast Stretching Curve');
hold on;
xlabel('Intensity in Input Image'); ylabel('Intensity in Output Image');

%% Display images
figure
montage({doubleImage_modified, StretchedImage}, 'Size', [1,2]);
title('Original Image (Left) | Contrast stretched Image (Right)');


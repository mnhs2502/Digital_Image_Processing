%% MATLAB code: Gray Level (Intensity Level) Slicing Transformation (Retain original intensity for other pixels)

close all;
clear all;
clc

%% Image Reading and Preprocessing

% Read the image and convert it to grayscale
OriginalImage = imread('woman.jpg');
GrayImage = rgb2gray(OriginalImage);
DoubleImage = double(GrayImage);

% Initialize output image matrix
StretchedImage = 0;

% Get size of the grayscale image
[row, col] = size(GrayImage);

%% Threshold Setup

% Set the lower and upper intensity thresholds
T1 = 150; % Lower threshold
T2 = 200; % Upper threshold

%% Gray Level Slicing Operation

% Loop through each pixel and apply slicing transformation
for i = 1:row
    for j = 1:col
        if (DoubleImage(i,j) > T1) && (DoubleImage(i,j) < T2)
            StretchedImage(i,j) = 255;  % Highlight pixels within the range
        else
            StretchedImage(i,j) = DoubleImage(i,j);    % Retain original intensity for other pixels (suppressing others)
        end
    end
end

%% Plotting Transformation Curve

curve = [];     % Initialize curve for plotting
hold on;

% Define the slicing curve manually
curve(1:T1) = 0 : T1-1;
curve(T1+1:T2-1) = 255;
curve(T2:256) = T2-1 : 255;

% Plot the transformation curve
axis tight;
plot(curve);
xlabel('Intensity in input image');
ylabel('Intensity in output image');
title('Gray Level (Intensity) Slicing Transformation Function');

%% Displaying the Result

% Show original and transformed images side by side
figure
montage({uint8(DoubleImage), uint8(StretchedImage)}, 'Size', [1 2]);
title('Original Image (Left) | Intensity Sliced Image (Right)');

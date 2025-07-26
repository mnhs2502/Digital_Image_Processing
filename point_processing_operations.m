% MATLAB Program for Point Processing Operations in DIP

clear all;
close all;
clc;

%% Read and Convert Image to Grayscale

OriginalImage = imread('woman.jpg');
grayImage = rgb2gray(OriginalImage);

figure
subplot(1,2,1); imshow(OriginalImage); title('Original');
subplot(1,2,2); imshow(grayImage); title('Gray Image');
%% 1. Thresholding to Binary
BinaryImage = imbinarize(grayImage);

figure
subplot(1,2,1); imshow(grayImage); title('Gray Image');
subplot(1,2,2); imshow(BinaryImage); title('Binary Image (Thresholded)');

%% 2. Intensity Addition (+50)
doubleImage = double(grayImage);
addedImage = doubleImage + 50;

figure
subplot(1,2,1); imshow(grayImage); title('Original Gray Image');
subplot(1,2,2); imshow(uint8(addedImage)); title('Intensity Increased (+50)');

%% 3. Intensity Subtraction (-50)
subtractedImage = doubleImage - 50;

figure
subplot(1,2,1); imshow(grayImage); title('Original Gray Image');
subplot(1,2,2); imshow(uint8(subtractedImage)); title('Intensity Decreased (-50)');

%% 4. Intensity Multiplication (×0.3)
multipliedImage = immultiply(grayImage, 0.3);

figure
subplot(1,2,1); imshow(grayImage); title('Original Gray Image');
subplot(1,2,2); imshow(multipliedImage); title('Multiplied (×0.3)');

%% 5. Intensity Division (÷0.3)

dividedImage = imdivide(grayImage, 0.3);

figure
subplot(1,2,1); imshow(grayImage); title('Original Gray Image');
subplot(1,2,2); imshow(dividedImage); title('Divided (÷0.3)');



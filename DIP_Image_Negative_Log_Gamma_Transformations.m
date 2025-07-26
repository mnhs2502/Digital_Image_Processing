% Image negatives, Log and PowerLaw (Gamma) transformations for DIP
% Implementation in MATLAB

clear all;
close all;
clc;

% Read the image and convert to grayscale
OriginalImage = imread('library.jpg');          % Load RGB image
GrayImage = rgb2gray(OriginalImage);                   % Convert RGB to Grayscale

% Display original and grayscale image side by side
montage({OriginalImage, GrayImage}, 'Size', [1,2]);
title('Original Image (Left) | Grayscale Image (Right)');

%% Image Negative
figure
doubledImage = double(GrayImage);                     % Convert to double for computation
negativeImage = 255 - doubledImage;                   % Negative transformation: s = L-1 - r
montage({GrayImage, uint8(negativeImage)}, 'Size', [1,2]);  % Display original and negative image
title('Original Image (Left) | Image Negative (Right)');

%% Log Transformation (Manual Loop Version)
figure
doubledImage = im2double(GrayImage);                  % Normalize image to [0,1] range
logImage = 0;                          % Initialize log image
[row, col] = size(doubledImage);             % Get image size
C = 3;                              % Constant scaling factor

% Apply log transformation pixel-wise: s = c * log(1 + r)
for i = 1:row
    for j = 1: col
        logImage(i, j) = C * log(1 + doubledImage(i, j));
    end
end

% Show original and log-transformed image
subplot(1, 2, 1)
imshow(doubledImage);
title('Original Image');
subplot(1, 2, 2)
imshow(logImage);
title('Log Transformed Image (c = 3)');

%% Log Transformation (Vectorized Version/Bitwise Operation)
figure
doubledImage = im2double(GrayImage);                  % Normalize again (optional redundancy)

% Apply log transform with different scaling factors
logImage2 = 2 * log(1 + doubledImage);           % Log with c=2
logImage3 = 3 * log(1 + doubledImage);           % Log with c=3
logImage4 = 4 * log(1 + doubledImage);           % Log with c=4

% Display results
subplot(221), imshow(doubledImage), title('Original Image');
subplot(222), imshow(logImage2), title('Log with c=2');
subplot(223), imshow(logImage3), title('Log with c=3');
subplot(224), imshow(logImage4), title('Log with c=4');

%% Power-Law / Gamma Transformation (Manual Loop Version)

doubledImage = im2double(GrayImage);                  % Normalize image
figure
gammaImage = 0;                        % Initialize gamma image
[row, col] = size(doubledImage);             % Get size of image
C = 1;                              % Scaling constant
gamma = 3;                          % Gamma value (>1 darkens the image)

% Apply gamma transformation pixel-wise: s = c * r^gamma
for i = 1:row
    for j = 1: col
        gammaImage(i, j) = C * doubledImage(i, j)^gamma;
    end
end

% Show original and gamma-transformed image
subplot(121)
imshow(doubledImage);
title('Original Image');
subplot(122)
imshow(gammaImage);
title('Gamma Factor 3');

%% Power-Law / Gamma Transformation (Vectorized Version/ Bitwise Operartion)
doubledImage = im2double(GrayImage);                  % Normalize image

% Apply gamma transformation for various gamma values
gammaImage4 = doubledImage.^3;                   % Gamma = 3
gammaImage5 = doubledImage.^4;                   % Gamma = 4
gammaImage6 = doubledImage.^5;                   % Gamma = 5

% Display results
subplot(221), imshow(doubledImage), title('Original Image');
subplot(222), imshow(gammaImage4), title('Gamma = 3');
subplot(223), imshow(gammaImage5), title('Gamma = 4');
subplot(224), imshow(gammaImage6), title('Gamma = 5');

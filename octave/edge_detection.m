#!/usr/bin/octave -qf

pkg load image;

img_file = '../images/lena.png';
img = imread(img_file);
figure, imshow(img), title(strcat(img_file)), pause();

img_gs = rgb2gray(img);
figure, imshow(img_gs), title(strcat(img_file, " grayscale")), pause();

%% close figures
close all;

%% Choose an edge detection method
%method = 'Sobel';
%method = 'Prewitt';
%method = 'Roberts';
method = 'LoG';  %% Laplacian of Gaussians
%method = 'Kirsch';
%method = 'Lindeberg';
%method = 'Canny';

%edges = edge(img_gs, method);
%figure, imshow(edges), title(method);
%pause();

%% Make a blurred / smoothed image
h = fspecial('gaussian', [11,11], 4);

%% Plot the Gaussian smoothing filter
figure, surf(h), pause(), close();

%% Apply the smoothing filter
img_smooth = imfilter(img_gs, h);
figure, imshow(img_smooth), title(strcat(img_file, " smoothed")), pause();

%% Method 2: shift left and right, and show diff image
img_l = img_smooth;
img_l(:, [1:(end - 1)]) = img_l(:, [2:end]);
img_r = img_smooth;
img_r(:, [2:(end)]) = img_r(:, [1:end-1]);

img_diff = double(img_r) - double(img_l);
figure, imshow(img_diff), title(strcat(img_file, " shifted & diffed")), pause();

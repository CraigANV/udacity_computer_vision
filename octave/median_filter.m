#!/usr/bin/octave -qf

pkg load image;

%image_file = '../images/moon.png';
%image_file = '../images/brooklyn-bridge.png';
image_file = '../images/penny-farthing.png';

moon = imread(image_file);
imshow(moon);
title(image_file);
pause();

%% Add salt and pepper noise
noisy_img = imnoise(moon, 'salt & pepper', 0.02);
imshow(noisy_img);
title("Additive salt and pepper noise");
pause();

%% Apply a median filter (non-linear)
median_filtered = medfilt2(noisy_img);
imshow(median_filtered);
title("Median filtered");
pause();

%% Create a Gaussian filter
filter_size = 11;
filter_sigma = 2;
filter = fspecial('gaussian', filter_size, filter_sigma);

%% Apply it to remove noise
gaussian_filtered = imfilter(noisy_img, filter);
imshow(gaussian_filtered);
title("Gaussian blur filtered");
pause();

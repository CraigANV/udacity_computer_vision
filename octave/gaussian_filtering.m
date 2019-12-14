#!/usr/bin/octave -qf

%% Load an image
saturn = imread('../images/saturn.png');
imshow(saturn);
pause();

%% Add some noise
noise_sigma = 25;
noise = randn(size(saturn)) .* noise_sigma;
noisy_img = saturn + noise;
imshow(noisy_img);
pause();

%% Create a Gaussian filter
filter_size = 11;
filter_sigma = 2;
pkg load image;
filter = fspecial('gaussian', filter_size, filter_sigma);

%% Apply it to remove noise
smoothed = imfilter(noisy_img, filter);
imshow(smoothed);
pause();

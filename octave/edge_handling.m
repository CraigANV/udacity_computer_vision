#!/usr/bin/octave -qf

pkg load image;

leaves = imread('../images/fall-leaves.png');

%% Create a Gaussian filter
filter_size = 21;
filter_sigma = 3;
filter = fspecial('gaussian', filter_size, filter_sigma);

%% Apply it, specifying an edge parameter

clipped = imfilter(leaves, filter, 0);  % black bleeds in at edges
imshow(clipped);
pause();

wraparound = imfilter(leaves, filter, 'circular'); % opposite side bleeds in
imshow(wraparound);
pause();

copy_edge = imfilter(leaves, filter, 'replicate'); % extends edge pixels - OKish
imshow(copy_edge);
pause();

reflect_edge = imfilter(leaves, filter, 'symmetric'); % reflect at edges
imshow(reflect_edge);
pause();

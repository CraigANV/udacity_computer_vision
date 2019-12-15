#!/usr/bin/octave -qf

pkg load image;

frizzy = imread('../images/frizzy.png');
froomer = imread('../images/froomer.png');

%imshow(frizzy);
%pause();
%imshow(froomer);
%pause();

%% convert to grayscale
frizzy_gray = rgb2gray(frizzy);
froomer_gray = rgb2gray(froomer);

frizzy_edges = edge(frizzy_gray, 'canny');
froomer_edges = edge(froomer_gray, 'canny');

imshow(frizzy_edges);
pause();
imshow(froomer_edges);
pause();

%% Display common edge pixels
imshow(frizzy_edges & froomer_edges);  %% binary AND
pause();

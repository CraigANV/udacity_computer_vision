#!/usr/bin/octave -qf

pkg load image;

% Gradient Direction
function result = select_gdir(gmag, gdir, mag_min, angle_low, angle_high)
    result = gmag >= mag_min & angle_low <= gdir & gdir <= angle_high;
endfunction

%% Load and convert image to double type, range [0, 1] for convenience
img = double(imread('../images/octagon.png')) / 255.;
imshow(img); % imshow assumes [0, 1] range for double images
pause();

%% Compute x, y gradients - returns a pair of matrices - sobel is default
[gx gy] = imgradientxy(img, 'sobel'); % Note: gx, gy are not normalized

%% Obtain gradient magnitude and direction
[gmag gdir] = imgradient(gx, gy);
imshow(gmag / (4 * sqrt(2))); % mag = sqrt(gx^2 + gy^2), so [0, (4 * sqrt(2))]
pause();
imshow((gdir + 180.0) / 360.0); % angle in degrees [-180, 180]
pause();

%% Find pixels with desired gradient direction
my_grad = select_gdir(gmag, gdir, 1, 30, 60); % 45 +/- 15
imshow(my_grad);  % NOTE: enable after you've implemented select_gdir
pause();

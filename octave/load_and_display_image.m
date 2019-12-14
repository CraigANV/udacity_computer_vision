#!/usr/bin/octave -qf

disp("Only printing this as you can't start a script with a function keyword...");

dolphin = imread('../images/dolphin.png');
bicycle = imread('../images/bicycle.png');
fruit = imread('../images/fruit.png');
saturn = imread('../images/saturn.png');

%% Load and display an image
img = imread('../images/bicycle.png');
imshow(img);

%% Waitkey
pause()

%% Image size
disp(size(img));

%% Image class or data type:
disp(class(img));

%% At a given location (row, col):
disp(img(50, 100));

%% Plot values for an entire row:
plot(img(50, :));
pause();

%% Extract a 2D slice between rows 101 to 103 and columns 201 to 203 (inclusive)
disp(img(101:103, 201:203));

%% Crop the image (ranges are inclusive)
cropped = img(110:310, 10:160);
disp(size(cropped));
imshow(cropped);
pause();

%% Extract the red channel of a colour image
img = imread('../images/fruit.png');
img_red = img(:, :, 1);
disp(size(img_red));
imshow(img_red);
pause();

%% Add two images
%% Images must be the same dimension for an eltwise sum
%% Divide by 2 to avoid saturation
summed = dolphin / 2 + bicycle / 2;
imshow(summed);
pause();

%% Multiply by a scalar
function result = scale(img, value)
    result = value .* img;
endfunction

imshow(scale(dolphin, 1.5));
pause();

function output = blend(a, b, alpha)
    output = a * alpha + b * (1 - alpha);
endfunction

result = blend(dolphin, bicycle, 0.85);
imshow(result);
pause();

diff = dolphin - bicycle;
imshow(diff);
pause();

%% Exact same result as aboe due to uint truncation
abs_diff = abs(dolphin - bicycle);
imshow(abs_diff);
pause();

%% Better: use the image package (see README for installation)
pkg load image;
imshow(imabsdiff(dolphin, bicycle));
pause();

%% Generate Gaussian noise
noise = randn([100 100]);
[n, x] = hist(noise, linspace(-3, 3, 21));  % n = counts, x = bin-centres
%disp([x; n]);
plot(x, n);
pause();

%% Add Gaussian noise to an image
noise = randn(size(saturn)) .* 100;
output = saturn + noise;
imshow(output);
pause();

#!/usr/bin/octave -qf

pkg load image;

einstein = imread('../images/einstein.jpg');
imshow(einstein);
title("einstein.jpg");
pause();

impulse_filter = [0,0,0;
                  0,1,0;
                  0,0,0];

blur_filter = [1,1,1;
               1,1,1;
               1,1,1];

unsharp_mask = impulse_filter * 2 - (1/9 * blur_filter);

same = imfilter(einstein, impulse_filter, 0);  % image conv* impulse = image
imshow(same);
title("Image convolved with impulse filter (i.e. unchanged)");
pause();

sum(sum(einstein - same , 2)) % verify they're identical (== 0)

sharpened = imfilter(einstein, unsharp_mask, 0);  % subtract the blur, sharpening the image
imshow(sharpened);
title("Image convolved with unsharp mask");
pause();

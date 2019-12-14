#!/usr/bin/octave -qf

pkg load image;

% Find template 2D
function [yIndex xIndex] = find_template_2D(template, img)
    c = normxcorr2(template, img);
    [yRaw xRaw] = find(c == max(c(:)));
    yIndex = yRaw - size(template, 1) + 1;
    xIndex = xRaw - size(template, 2) + 1;
endfunction

pkg load image; % AFTER function definition

% Test code:
tablet = imread('../images/tablet.png');
imshow(tablet);
pause();
glyph = tablet(75:165, 150:185);
imshow(glyph);

[y x] = find_template_2D(glyph, tablet);
disp([y x]); % should be the top-left corner of template in tablet

% Plot where the template was found
colormap('gray'), imagesc(tablet);
hold on;
plot(x, y, 'r+', 'markersize', 16);
pause();
hold off;

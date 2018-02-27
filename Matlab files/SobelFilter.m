%For Sobel transform
clear all;
close all;
im = imread('./test/house.bmp');
im = double(im);

SH = [-1 -2 -1
      0 0 0
      1 2 1];

SV = [-1 0 1
     -2 0 2
     -1 0 1];
 
% im2 = filter2(SH, im,'same');
im2=imfilter(im,SH,'same');
im3 = filter2(SV, im, 'same');
im4 = sqrt((im2.^2+im3.^2)/2);
 


figure,
subplot(2,2,1),image(im);
colormap(gray(256));
axis image;
axis off;
title('original image');

subplot(2,2,2),image(abs(im2));
colormap(gray(256));
axis image;
axis off;
title('After Horizontal Sobel Filter');

subplot(2,2,3),image(abs(im3));
colormap(gray(256));
axis image;
axis off;
title('After Verticle Sobel Filter');

subplot(2,2,4),image(im4);
colormap(gray(256));
axis image;
axis off;
title('After Horizontal & Verticle Sobel Filter');
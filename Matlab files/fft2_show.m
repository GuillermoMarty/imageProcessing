%Using fft to find the cracks of spatial domain
clear all;
close all;

im = double(imread('./test/jf3.jpg'));
im =(im(:,:,1)+im(:,:,2)+im(:,:,3))/3;

im2 = fftshift(fft2(im));
im3 = log(abs(im2)+1);

figure,
subplot(2,1,1),imagesc(im);
colormap(gray(256));
axis image;
axis off;
title('original image');

subplot(2,1,2),imagesc(im3);
colormap(gray(256));
axis image;
axis off;
title('In the frequency domain');

close all
im=imread('./test/lena.tif');
im2 = fft(im,[], 2);
im3 = fft(im,[], 1);
im4 = im3+im2
figure, imshow(im);
figure, imshow(im2);
figure, imshow(im3);
figure, imshow(im4);
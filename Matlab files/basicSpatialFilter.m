clc
clear all
close all
%im = imread('./standard_test_images/house.bmp');
im = imread('./standard_test_images/moon.jpeg');
im = double(im);
figure,imagesc(im);
colormap(gray(256));

w = fspecial(
w=[1 1 1; 1 1 1; 1 1 1]/9;

% im2=imfilter(im,w,'same'); % AVR
% figure,imagesc(im2);
% colormap(gray(256));


w=[0 1 0; 1 -4 1; 0 1 0]; % laplacian n center
im3=imfilter(im,w,'same');
% im3=im3./max(im3(:));
% im=im./max(im(:));
figure,imagesc(im3);
colormap(gray(256));
imo=im-im3;
figure,imagesc(imo);
colormap(gray(256));

w=[0 -1 0; -1 4 -1; 0 -1 0]; % laplacian p center
im4=imfilter(im,w,'same');
figure,imagesc(im4);
colormap(gray(256));
imo=im+im4;
figure,imagesc(imo);
colormap(gray(256));
i=i;
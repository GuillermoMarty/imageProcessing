clc
clear all
close all
im = imread('./standard_test_images/house.tif');
%im = imread('./standard_test_images/moon.jpg');
im = double(im); 
figure,imagesc(im);
colormap(gray(256));

 
w=fspecial('log',[5, 5],0.5);

im2=imfilter(im,w,'same'); % AVR
figure,imagesc(im2);
colormap(gray(256));


w=[0 1 0; 1 -4 1; 0 1 0]; % laplacian n center
im3=imfilter(im,w,'same');
% im3=im3./max(im3(:));
% im=im./max(im(:));
figure,imagesc(im3);
colormap(gray(256));
imo=im-im3;
figure,imagesc(imo);
colormap(gray(256));

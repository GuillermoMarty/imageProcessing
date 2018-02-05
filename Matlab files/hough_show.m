%demo for line detection using Hough transform
clear all;
close all;
%   im = imread('./test/hough.gif');
im = imread('./test/hough2.jpg');
im = double(im);
% T = 15;
eim=im;
% eim = edge(im,'sobel',T);
%  eim = bwmorph(eim,'clean'); %using binary morphology to clean the independent dots

%   [eim_h,nim] = line_hough2(eim);
eim_h = line_hough2(eim);

figure,subplot(2,1,1),image(im);
colormap(gray(256));
title('Original Image');
axis image;
axis off;

subplot(2,1,2),imagesc(eim_h);
colormap(gray(256));
title('After Hough Transform');
axis image;
axis off;
figure,image(eim_h)

 
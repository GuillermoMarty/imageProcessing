clc
clear all
close all

im=imread('./test/iris.bmp');
im = double(im);
im2 = im(1:2:end,1:2:end);
figure,subplot(2,2,1),imagesc(im2);
colormap(gray(256));
axis image;
axis off;


%% edge
SH = [-1 -2 -1
      0 0 0
      1 2 1];

SV = [-1 0 1
     -2 0 2
     -1 0 1];
% you could get edge image by sobel filter
im_edge=zeros(size(im2,1),size(im2,2)); %% need change

%% get the center location
r=20; % a radius big enough to select the pupil

tfill=zeros(r*2+1);
tcircle(1,r+1)=1;
tcircle(r*2+1,r+1)=1;
mn_ang=1/r;
for i=0:mn_ang:pi/2
    y=round(r*cos(i));
    x=round(r*sin(i));
    tcircle(r+1+x,r+1+y)=1;
    tcircle(r+1+x,r+1-y)=1;
    tcircle(r+1-x,r+1+y)=1;
    tcircle(r+1-x,r+1-y)=1;
    if y>5 & r+1-x>5 & r+1+x<r*2-5
        tfill(r+1-x,r+1-y+5:r+1+y-5)=1;
        tfill(r+1+x,r+1-y+5:r+1+y-5)=1;
    end
end 
 
w=tcircle;
im3=imfilter(im_edge,w,'same');
figure,imagesc(im3);
colormap(gray(256));
axis image;
axis off;
 
 

%% clear the noise pixels based on distance to center
% center location row=67 column=90
 
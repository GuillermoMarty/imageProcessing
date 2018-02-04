%This program is to equalize the histogram for image enhancement
clear im;
im=imread('./standard_test_images/pirate.tif');
im=double(im);
% im_eq = histeq(im);
c=myhist(im); %User our own function to generate the histogram

d=zeros(256,1);
[co,ro]=size(im);
clear x;
old_hist = c;
for i=2:256
   c(i)=c(i)+c(i-1);
end;

c=c*255;
cinv=zeros(255,1);
for i=1:255
     cinv(floor(c(i)+1))=i; 
end

% 
% x=1:255;
% xi=1:0.25:255;
% cinv_i=interp1(x,cinv,xi,'pchip');

 
figure,plot(c)
figure,plot(cinv)


for x=1:co
   for y=1:ro
      f(x,y)=floor(c(im(x,y)+1));
    end;
end;

new_hist = myhist(f);

figure(1);
subplot(2,1,1),image(im);
colormap(gray(256));
title('original image');
axis image;
axis off;
subplot(2,1,2),bar(old_hist);

figure(2);
subplot(2,1,1),image(f);
colormap(gray(256));
axis image;
axis off;
subplot(2,1,2),bar(new_hist);
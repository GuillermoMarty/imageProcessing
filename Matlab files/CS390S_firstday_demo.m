clc
clear all
close all


path='./standard_test_images/'; % this is your working path
impath=[path,'lena_color_256.tif']; % path of the image
out_impath=[path,'output/','lena_gray_256.tif'];% path of the output image
im=imread(impath);
figure,imshow(im);

%[r,c,ch]=size(im);
%img=zeros(r,c);
img=rgb2gray(im);
figure,imshow(img);

for i = 1 : 256
    for j = 1 : 256
        dist = ((i-128)^2+(j-128)^2)^(.5);
        if dist <80
            im(i,j) = 255;
        else 
            im (i,j) = 0;
        end
    end
end
image (im);

imwrite(img,out_impath);
i=i;
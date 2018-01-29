%Guillermo Martinez
%Homework 1
%CS390 S

% This program reads in an image, generates a mask for the background
% and then creates 4 images.  It first saves the mask for the background 
% , then the image with the foreground removed similar to the example image
% on blackboard, then the image with only the wolf present (and in black
% and white), and finally the wolf grayscaled and balck and white which is 
% then inverted and the background is colored black.
clc
clear all
close all

path='./my_test_images/'; % working path
impath=[path,'grayWolf.jpg']; % path of the image
out_impath1=[path,'mask.jpg'];% path of the output image
out_impath2=[path,'backgroundOnly.jpg'];
out_impath3=[path,'forgroundOnly.jpg'];
out_impath4=[path,'invertedWolf.jpg'];

img = imread(impath);
%resize it to 450x750
graysmall = imresize (img, .25);


figure, imshow(graysmall);
%Creates a mask from the manual points plotted using the image
%segmentor tool 
mask = segmentImage(graysmall);
%Save/show mask as required in step 2 of instructions.
imwrite (mask, out_impath1);
figure, imshow (mask);

%removes the wolf and leaves the background
gray=graysmall;
for i = 1 : 450
    for j = 1 : 720
        if mask(i,j) == 0
            gray(i)=255;
        else
            gray(i,j,:) =0;
        end
    end
end

%removes the background and leaves the wolf, also grayscales
gray2=graysmall;
for i = 1 : 450
    for j = 1 : 720
        if mask(i,j) == 0
            gray2(i,j,:)=gray2(i,j,:)+255;
            
        else
            gray2(i,j,:) =rgb2gray(graysmall(i,j,:));
        end
    end
end

%Blacks out the background, and inverts the grayscaled wolf
gray3=graysmall;
for i = 1 : 450
    for j = 1 : 720
        if mask(i,j) == 0
            gray3(i,j,:)=gray3(i,j,:)-255;
            
        else
            gray3(i,j,:) = rgb2gray(graysmall(i,j,:));
            gray3(i,j,:) = 255 - gray3(i,j,:);
        end
    end
end

%Display the new images
figure, image (gray);
figure, image (gray3);
figure, image (gray2);

%writes the new images to the appropriate files
imwrite (gray, out_impath2);
imwrite (gray2, out_impath3);
imwrite (gray3, out_impath4);


clc
clear all
close all

path='./my_test_images/'; % working path
impath=[path,'grayWolf.jpg']; % path of the image
out_impath=[path,'mask.jpg'];% path of the output image

img = imread(impath);
%resize it to 450x750
graysmall = imresize (img, .25);


figure, imshow(graysmall);
%Creats a mask from the manual points plotted using the image
%segmentor tool 
mask = segmentImage(graysmall);
%Save/show mask as required in step 2.
imwrite (mask, out_impath);
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


figure, image (gray);
figure, image (gray2);
figure, image (gray3);


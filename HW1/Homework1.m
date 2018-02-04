%Guillermo Martinez
%Homework 1
%CS390 S

% This program reads in an image, generates a mask for the background
% and then creates 4 images.  It first saves the mask for the background 
% , then the image with the foreground removed similar to the example image
% on blackboard, then the image with only the wolf present (and in black
% and white).  Gamma correction is applied, the wolf is darkended
% and finally the original colored eyes are put back in.

clc
clear 
close all

path='./my_test_images/'; % working path
impath=[path,'grayWolf.jpg']; % path of the image
out_impath1=[path,'mask.jpg'];% path of the output image
%out_impath2=[path,'backgroundOnly.jpg'];
%out_impath3=[path,'forgroundOnly.jpg'];
out_impath4=[path,'maskEyes.jpg'];
%out_impath5=[path,'eqWolf.jpg'];
%out_impath7=[path,'degamma.jpg'];
%out_impath8=[path,'gamma.jpg'];
out_impath9=[path,'final.jpg'];

img = imread(impath);
%resize it to 450x750
graysmall = imresize (img, .25);



%figure, imshow(graysmall);
%Creates a mask from the manual points plotted using the image
%segmentor tool for background/ foreground, and one to isolate
%the eyesfrom the image
mask = segmentImage(graysmall);
maskEyes = segmentEyes(graysmall);



%removes the wolf and leaves the background
%gray=graysmall;
%for i = 1 : 450
%    for j = 1 : 720
%        if mask(i,j) == 0
%            gray(i)=255;
%        else
%            gray(i,j,:) =0;
%        end
%    end
%end

%removes the background and leaves the wolf, also grayscales
gray2=graysmall;
for i = 1 : 450
    for j = 1 : 720
        if mask(i,j) == 0
            gray2(i,j,:)=250;
            
        else
            gray2(i,j,:) =rgb2gray(graysmall(i,j,:));
        end
    end
end

%Blacks out the background, and inverts the grayscaled wolf
%gray3=graysmall;
%for i = 1 : 450
%    for j = 1 : 720
%        if mask(i,j) == 0
%            gray3(i,j,:)=gray3(i,j,:)-255;            
%        else
%            gray3(i,j,:) = rgb2gray(graysmall(i,j,:));
%            gray3(i,j,:) = 255 - gray3(i,j,:);
%        end
%    end
%end


%Analyzation
%imhist(graysmall);
%imhist(gray2);
eqGray = histeq(gray2);
%figure, image (eqGray);

 hgamma = ...
   vision.GammaCorrector(1.5,'Correction','de-gamma');
 x = step(hgamma, gray2);
 
 igamma = ...
   vision.GammaCorrector(1.5,'Correction','gamma');
 y = step(igamma, gray2);
 
 %figure, imshow(x); 
 %title('Enhanced Image after De-gamma Correction');
 %figure, imshow(y); 
 %title('Enhanced Image after Gamma Correction');
 
 gray4 = y;
for i = 1 : 450
    for j = 1 : 720
        if mask(i,j) == 0
            gray4(i,j,:)=y(i,j,:);
            
        else
            gray4(i,j,:) =y(i,j,:)-10;
        end
    end
end

for i = 1 : 450
    for j = 1 : 720
        if maskEyes(i,j) == 0
            gray4(i,j,:)=gray4(i,j,:);
            
        else
            gray4(i,j,:) =graysmall(i,j,:);
        end
    end
end

figure, imshow(graysmall);
title('Original Image');
figure, imshow(gray4);
title('Final Image'); 

%imhist (eqGray);
%writes the new images to the appropriate files
imwrite (mask, out_impath1);
%imwrite (gray, out_impath2);
%imwrite (gray2, out_impath3);
imwrite (maskEyes, out_impath4);
%imwrite (eqGray, out_impath5);
%imwrite (x, out_impath7);
%imwrite (y, out_impath8);
imwrite (gray4, out_impath9);



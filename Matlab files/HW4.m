clear all 
close all

grayImage = 255 * ones(240, 320, 'uint8');
grayImage = mat2gray(grayImage);
grayImage4 = grayImage;


[rows, columns, numberOfColorBands] = size(grayImage);
circleCenterX = 160; 
circleCenterY =  120; % square area 0f 500*500 
circleRadius = 80;    % big circle radius 
circleImage = false(rows, columns); 
[x, y] = meshgrid(1:columns, 1:rows); 
circleImage((x - circleCenterX).^2 + (y - circleCenterY).^2 <= circleRadius.^2) = true; 
% Display it in the upper right plot. 
for i = 1 : 240
    for j = 1 : 320
        if circleImage(i,j) == false
            grayImage4(i,j,:)=0.7;
        else
            grayImage4(i,j) = 0.4;
        end
    end
end

gausNoise = imnoise(grayImage4,'gaussian',0,0.01)
snpNoise = imnoise(grayImage4,'salt & pepper', 0.02);
uniNoise = (grayImage4 + rand(size(grayImage4)))/2;

gausRemoved = wiener2(gausNoise,[8 8]);
%h = ones(5,5) / 25;
%J = filter2(fspecial('average',6),gausNoise);
%L = (K + J)/2;
%H = imfilter(L,h);
%gausRemoved = medfilt2(L);
%gausRemoved = conv2(double(H), ones(3)/9, 'same');

%M = uniNoise - rand(size(uniNoise));
%N = (medfilt2(uniNoise)+M);
O = wiener2(gausNoise,[8 8]);
%P = imgaussfilt(uniNoise)
uniRemoved=double(O);
S_=size(uniRemoved);
Mask=7;
for i=1:S_(1)
    j=1;
    while(j<S_(2)-Mask)
        T(1:Mask)=uniRemoved(i,j:j+(Mask-1));
        Data=harmmean(T);
        uniRemoved(i,j+1)=Data;
        j=j+1;
    end;
end;
%imshow(uint8(Im));

snpRemoved = medfilt2(snpNoise);

figure,subplot(5,3,1),imshow(grayImage4);
title('Original');
axis image;
axis off;
subplot(5,3,3),histogram(grayImage4);
title('Original Histogram');
subplot(5,3,4),imshow(gausNoise);
title('Gaussian Noise');
subplot(5,3,5),imshow(uniNoise);
title('Uniform Noise');
subplot(5,3,6),imshow(snpNoise);
title('Salt and Pepper Noise');

subplot(5,3,7),histogram(gausNoise);
title('Gaussian Histogram');
subplot(5,3,8),histogram(uniNoise);
title('Uniform Histogram');
subplot(5,3,9),histogram(snpNoise);
title('Salt-Pepper Histogram');

subplot(5,3,10),imshow(gausRemoved);
title('Gaussian Removed');
subplot(5,3,11),imshow(uniRemoved);
title('Uniform Removed');
subplot(5,3,12),imshow(snpRemoved);
title('Salt-Pepper Removed');

subplot(5,3,13),histogram(gausRemoved);
title('Gaussian Histogram');
subplot(5,3,14),histogram(uniRemoved);
title('Uniform Histogram');
subplot(5,3,15),histogram(snpRemoved);
title('Salt-Pepper Histogram');

clc
close all;
clear;
%-----------------------------------------------------------------------
[file, path] = uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
i = [path, file];
subplot(2,2,1);
image = imread(i);
imshow(image);
subplot(2,2,2);
newImage = imresize(image, [300 500]);
imshow(newImage);

%-----------------------------------------------------------------------
grayImage = mygrayfun(newImage);
subplot(2,2,3);
imshow(grayImage);

%-----------------------------------------------------------------------
threshold = 122;
binaryImage = mybinaryfun(grayImage, threshold);
subplot(2,2,4);
imshow(binaryImage);

%-----------------------------------------------------------------------
% part5 and part6 and pqrt7

%-----------------------------------------------------------------------

% Printing the plate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file = fopen('number_Plate.txt', 'wt');
fprintf(file,'%s\n',final_output);
fclose(file);
winopen('number_Plate.txt')



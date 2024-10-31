close all;
clc;clear;

X=imread('Amsterdam.jpg');
X=rgb2gray(X);

Nch=32;
mapset=cell(2,Nch);
Alphabet ='ABCDEFGHIJKLMNOPQRSTUVWXYZ ,;?.!';
for i=1:Nch
    mapset{1,i}=Alphabet(i);
    mapset{2,i}=dec2bin(i-1,5);
end

messaeg = 'hello';
output_img1 = coding (messaeg, X, mapset);   



figure
plot1=subplot(1,2,1);
imshow(X)
title('Original PIC')
plot2=subplot(1,2,2);
imshow(output_img1)
title('Coded PIC')
linkaxes([plot1 plot2])



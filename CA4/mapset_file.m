close all;
clc;clear;

Nch=32;
mapset = cell(2,Nch);
Alphabet ='ABCDEFGHIJKLMNOPQRSTUVWXYZ ,;?.!';
for i=1:Nch
    mapset{1,i}=Alphabet(i);
    mapset{2,i}=dec2bin(i-1,5);
end

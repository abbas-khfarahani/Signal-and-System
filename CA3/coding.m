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

message='SALAAM!';
message_len=length(message);
message_bin=cell(1,message_len);
for i=1:message_len
    ch=message(i);
    for j=1:Nch
        if ch==mapset{1,j}
            message_bin{i}=mapset{2,j};
        end
    end
end

binarymessage=cell2mat(message_bin);
binarymessage_len=length(binarymessage);
Y=X;

for i=1:binarymessage_len
   vals=X(i); 
   valsbin=dec2bin(vals);
   valsbin(end)=binarymessage(i);
   Y(i)=bin2dec(valsbin);    
end

figure
plot1=subplot(1,2,1);
imshow(X)
title('Original PIC')
plot2=subplot(1,2,2);
imshow(Y)
title('Coded PIC')
linkaxes([plot1 plot2])


% Decoding
DcodedMessageBin=[];
flag=1; 
ind=1;
while flag
    characterbin=zeros(1,5);
    for cont=1:5
        vals=Y(ind);
        vals1=dec2bin(vals);
        characterbin(cont)=str2double(vals1(end));
        ind=ind+1;        
    end
    num=sum(characterbin.*(2.^(4:-1:0)))+1;
    if strcmp(Alphabet(num),'!')
        flag=0;
    else
        DcodedMessageBin=[DcodedMessageBin Alphabet(num)];
    end
end

sprintf(DcodedMessageBin)
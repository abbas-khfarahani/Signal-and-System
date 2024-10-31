function [binaryImage] = mybinaryfun(grayImage, threshold)
[numrows, numclos] = size(grayImage);
binaryImage = zeros(numrows, numclos);

for i = 1 : numrows
    for j = 1 : numclos
        if grayImage(i, j) > threshold
            binaryImage(i, j) = 1;
        else
            binaryImage(i, j) = 0;
        end
    end
end

end
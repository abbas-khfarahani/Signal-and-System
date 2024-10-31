function [garyImage] = mygrayfun(intiImage)
[numrows, numclos, ~] = size(intiImage);
grayImage = zeros(numrows, numclos);
for i = 1 : numrows
    for j = 1 : numclos
        garyImage(i, j) = 0.578 * intiImage(i, j, 1) + 0.299 * intiImage(i, j, 2) + 0.114 * intiImage(i, j, 3);
    end
end

end
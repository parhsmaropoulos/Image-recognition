i = imread("vegetables.jpg");
im = rgb2gray(i);
L = superpixels(im,500);
figure
imshow(im)
h1 = impoly(gca,[72,105; 1,231; 20,366; 104,359;
    394,307; 518,343; 510,39; 149,72]);
    
    roiPoints = getPosition(h1);
roi = poly2mask(roiPoints(:,1),roiPoints(:,2),size(L,1),size(L,2));

BW = grabcut(im,L,roi);
figure
imshow(BW)

maskedImage = im;
maskedImage(repmat(~BW,[1 1 3])) = 0;
figure;
imshow(maskedImage)
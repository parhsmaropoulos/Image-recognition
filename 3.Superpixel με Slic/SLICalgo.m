fabric = imread("fabric.jpg");
[L,N]  = superpixels(fabric, 500);

figure

BW = boundarymask(L);
imshow(imoverlay(fabric,BW,'yellow'),'InitialMagnification',67)
title("Image Segmantation to Superpixels")



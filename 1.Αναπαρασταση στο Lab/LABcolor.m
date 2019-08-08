I = imread("fabric.jpg");
Lab_fabric = rgb2lab(I);

imshow(Lab_fabric)
title("Imaged Displayed in Lab Color Space")
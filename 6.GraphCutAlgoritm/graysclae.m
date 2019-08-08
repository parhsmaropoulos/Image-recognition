I = imread("vegetables.jpg");
Im = rgb2gray(I);
Img = imresize(Im,[128,128]);
pad = 3;
MAXVAL=255;
[NCUT]=graphcuts(Img,pad,MAXVAL);
imshow([NCUT]);



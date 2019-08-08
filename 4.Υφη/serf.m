% detect surf features
I = imread("fabric.jpg");
Im = rgb2gray(I);

points = detectSURFFeatures(Im);

imshow(Im); hold on;
plot(points.selectStrongest(15));
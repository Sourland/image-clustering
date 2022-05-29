%--------------------------------------------------------------------------
% A demo to showcase the functionality of spectral clustering of a random
% small-sized image
%                       Dimitrios Sourlantzis
%                Electrical and Computer Engineering
%                 Course:: Digital Image Processing
%--------------------------------------------------------------------------

clear;clc;close all;
rng(1)
diphw2 = load('dip_hw_2.mat');
addpath('src')  
%% Image 1, k = 3
image1AffinityMatrix = Image2Graph(diphw2.d2a);
clusterIdxImage1 = myGraphSpectralClustering(image1AffinityMatrix, 3);
clusterImage = reshape(label2rgb(clusterIdxImage1), [50,50,3]);
clusterImage = permute(clusterImage, [2 1 3]);
figure()
subplot(1, 2, 1)
imshow(diphw2.d2a)
title('Original Image')
subplot(1, 2, 2)
imshow(clusterImage)
cd('images');
imwrite(clusterImage, '3-clusters-d2a.png');
cd('..');
title('Clustered Image, k = 3')

%% Image 1, k = 4
image1AffinityMatrix = Image2Graph(diphw2.d2a);
clusterIdxImage1 = myGraphSpectralClustering(image1AffinityMatrix, 4);
clusterImage = reshape(label2rgb(clusterIdxImage1), [50,50,3]);
clusterImage = permute(clusterImage, [2 1 3]);
figure()
subplot(1, 2, 1)
imshow(diphw2.d2a)
title('Original Image')
subplot(1, 2, 2)
imshow(clusterImage)
cd('images');
imwrite(clusterImage, '4-clusters-d2a.png');
cd('..');
title('Clustered Image, k = 4')

%% Image 2, k = 3
image1AffinityMatrix = Image2Graph(diphw2.d2b);
clusterIdxImage1 = myGraphSpectralClustering(image1AffinityMatrix, 3);
clusterImage = reshape(label2rgb(clusterIdxImage1), [50,50,3]);
clusterImage = permute(clusterImage, [2 1 3]);
figure()
title('Image2, k = 3')
subplot(1, 2, 1)
imshow(diphw2.d2b)
title('Original Image')
subplot(1, 2, 2)
imshow(clusterImage)
cd('images');
imwrite(clusterImage, '3-clusters-d2b.png');
cd('..');
title('Clustered Image, k = 3')

%% Image 2, k = 4
image1AffinityMatrix = Image2Graph(diphw2.d2b);
clusterIdxImage1 = myGraphSpectralClustering(image1AffinityMatrix, 4);
clusterImage = reshape(label2rgb(clusterIdxImage1), [50,50,3]);
clusterImage = permute(clusterImage, [2 1 3]);
figure()
title('Image2, k = 4')
subplot(1, 2, 1)
imshow(diphw2.d2b)
title('Original Image')
subplot(1, 2, 2)
imshow(clusterImage)
cd('images');
imwrite(clusterImage, '4-clusters-d2b.png');
cd('..');
title('Clustered Image, k = 4')

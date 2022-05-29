%--------------------------------------------------------------------------
% A demo to showcase the functionality of a single step of recursive
% n-cutting
%                       Dimitrios Sourlantzis
%                Electrical and Computer Engineering
%                 Course:: Digital Image Processing
%--------------------------------------------------------------------------
%% Initialize Script
clear;clc;close all;
rng(1)
diphw2 = load('dip_hw_2.mat');
addpath('src')

%% Image 1, k = 2
affinityMat = Image2Graph(diphw2.d2a);
clusterIdx = myGraphSpectralClustering(affinityMat, 2);
nCutValue = calculateNcut(affinityMat , clusterIdx)
clusterImage = reshape(label2rgb(clusterIdx), [50,50,3]);
clusterImage = permute(clusterImage, [2 1 3]);
figure()
subplot(1, 2, 1)
imshow(diphw2.d2a)
title('Original Image')
subplot(1, 2, 2)
imshow(clusterImage)
cd('images');
imwrite(clusterImage, 'ncut-1step-d2a.png');
cd('..');
title('Clustered Image, k = 2')

%% Image 2, k = 2

affinityMat = Image2Graph(diphw2.d2b);
clusterIdx = myGraphSpectralClustering(affinityMat, 2);
nCutValue = calculateNcut(affinityMat , clusterIdx)
clusterImage = reshape(label2rgb(clusterIdx), [50,50,3]);
clusterImage = permute(clusterImage, [2 1 3]);
figure()
subplot(1, 2, 1)
imshow(diphw2.d2b)
title('Original Image')
subplot(1, 2, 2)
imshow(clusterImage)
cd('images');
imwrite(clusterImage, 'ncut-1step-d2b.png');
cd('..');
title('Clustered Image, k = 3')


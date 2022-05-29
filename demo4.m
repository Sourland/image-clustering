%--------------------------------------------------------------------------
% A demo to showcase the functionality of superpixel segmentation
%                       Dimitrios Sourlantzis
%                Electrical and Computer Engineering
%                 Course:: Digital Image Processing
%--------------------------------------------------------------------------
%% Ιnitialize Script
clear;clc;close all
rng(1);
mex slicmex.c
imIn = imread('bee.jpg');

global maxNCutValue;
global minElementsPerCluster;

reqNumLabels = 400;
cFactor = 20;

%% Transform Image to Super Pixels
[labels , ~] = slicmex(imIn, reqNumLabels , cFactor);
outputImage = superpixelDescriptor(imIn, labels);
[X, Y, n] = size(outputImage);
imshow(outputImage)
cd('images');
imwrite(outputImage, 'bee-super-greyscale.png');
cd('..');

% temp = superpixelDescriptor(imIn, labels, 'coloring');
% cd('images');
% imwrite(temp, 'bee-super-RGB.png');
% cd('..');
%% Create a list with every superpixel
[uniqueLabels, startingIndex, ~] = unique(labels);
startingIndex = uint32(startingIndex);
imageVector = reshape(im2double(outputImage), [X*Y, n]);
superPixelIm = imageVector(startingIndex, :);

%% Create super pixel affinity matrix and perform image clustering using non recursive n-cuts
superAffinityMat = SuperImage2Graph(superPixelIm);

superClusterIdxk6 = myGraphSpectralClustering(superAffinityMat, 6);
superClusterIdxk10 = myGraphSpectralClustering(superAffinityMat, 10);

%% Label every normal pixel according to its superpixel label
clustersk6 = zeros(X*Y,1);
for i = 1:size(uniqueLabels, 1)        
    indexes = find(labels == uniqueLabels(i));
    clusterId = superClusterIdxk6(i).*ones(length(indexes),1);

    clustersk6(indexes,:) = clusterId; 
end

clustersk10 = zeros(X*Y,1);
for i = 1:size(uniqueLabels, 1)        
    indexes = find(labels == uniqueLabels(i));
    clusterId = superClusterIdxk10(i).*ones(length(indexes),1);

    clustersk10(indexes,:) = clusterId; 
end

clusterImage = label2rgb(reshape(clustersk6, [X, Y]));
figure()
imshow(uint8(clusterImage))
title('Clustered Image, k = 6')
cd('images');
imwrite(clusterImage, 'bee-cluster-6.png');
cd('..');

clusterImage = label2rgb(reshape(clustersk10, [X, Y]));
figure()
imshow(uint8(clusterImage))
title('Clustered Image, k = 10')
cd('images');
imwrite(clusterImage, 'bee-cluster-10.png');
cd('..');

%% Perform recursive image clustering

minElementsPerCluster = 20;
maxNCutValue = 0.98;

nCutValuesk6 = [];
[superClusterIdxk6, nCutValuesk6] = myImageClustering(superAffinityMat, 1, nCutValuesk6);
clustersk6 = zeros(X*Y,1);
for i = 1:size(uniqueLabels, 1)        
    indexes = find(labels == uniqueLabels(i));
    clusterId = superClusterIdxk6(i).*ones(length(indexes),1);

    clustersk6(indexes,:) = clusterId; 
end


clusterImage = label2rgb(reshape(clustersk6, [X, Y]));
figure()
imshow(uint8(clusterImage))
title('Clustered Image, k = 6')
cd('images');
imwrite(clusterImage, 'bee-cluster-6-recursive.png');
cd('..');


minElementsPerCluster = 10;
maxNCutValue = 0.985;

nCutValuesk10 = [];
[superClusterIdxk10, nCutValuesk10] = myImageClustering(superAffinityMat, 1, nCutValuesk10);

clustersk10 = zeros(X*Y,1);
for i = 1:size(uniqueLabels, 1)        
    indexes = find(labels == uniqueLabels(i));
    clusterId = superClusterIdxk10(i).*ones(length(indexes),1);

    clustersk10(indexes,:) = clusterId; 
end

clusterImage = label2rgb(reshape(clustersk10, [X, Y]));
figure()
imshow(uint8(clusterImage))
title('Clustered Image, k = 10')
cd('images');
imwrite(clusterImage, 'bee-cluster-10-recursive.png');
cd('..');

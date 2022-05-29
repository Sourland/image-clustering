%--------------------------------------------------------------------------
% A demo to showcase the functionality of recursive n-Cutting clustering
%                       Dimitrios Sourlantzis
%                Electrical and Computer Engineering
%                 Course:: Digital Image Processing
%--------------------------------------------------------------------------


%% Initialize demo script
clear;clc;close all;
rng(1)
diphw2 = load('dip_hw_2.mat');
global maxNCutValue;
global minElementsPerCluster;

%% Demo for image d2a
minElementsPerCluster = 5;
maxNCutValue = 0.6;
nCutValues = [];
affinityMat = Image2Graph(diphw2.d2a);
[clusters, nCutValues] = myImageClustering(affinityMat, 1, nCutValues);

labels = unique(clusters);

for i = 1:length(labels)
    for j = 1:length(clusters)
        if clusters(j) == labels(i)
            clusters(j) = i;
        end
    end
end

clusterImage = reshape(label2rgb(clusters), [50,50,3]);
clusterImage = permute(clusterImage, [2 1 3]);
figure()
subplot(1, 2, 1)
imshow(diphw2.d2a)
title('Original Image')
subplot(1, 2, 2)
imshow(clusterImage)
cd('images');
imwrite(clusterImage, 'd2a-recursion-clustering.png');
cd('..');
title('Clustered Image, k = 2')

%% Demo for image d2b
minElementsPerCluster = 250;
maxNCutValue = 1;
nCutValues = [];
affinityMat = Image2Graph(diphw2.d2b);
[clusters, nCutValues] = myImageClustering(affinityMat, 1, nCutValues);

labels = unique(clusters);

for i = 1:length(labels)
    for j = 1:length(clusters)
        if clusters(j) == labels(i)
            clusters(j) = i;
        end
    end
end

clusterImage = reshape(label2rgb(clusters), [50,50,3]);
clusterImage = permute(clusterImage, [2 1 3]);
figure()
subplot(1, 2, 1)
imshow(diphw2.d2b)
title('Original Image')
subplot(1, 2, 2)
imshow(clusterImage)
cd('images');
imwrite(clusterImage, 'd2b-recursion-clustering.png');
cd('..');
title('Clustered Image, k = 2')

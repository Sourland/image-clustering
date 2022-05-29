%--------------------------------------------------------------------------
% A demo to showcase the functionality of spectral clustering on a graph.
% The graph is in affinity matrix form.
%                       Dimitrios Sourlantzis
%                Electrical and Computer Engineering
%                 Course:: Digital Image Processing
%--------------------------------------------------------------------------

clear;clc;close all;
rng(1)
addpath('src')  
diphw2 = load('dip_hw_2.mat');

clusterIdx = myGraphSpectralClustering(diphw2.d1a, 2)
clustImg = label2rgb(clusterIdx);
figure()
hold on
imshow(clustImg)

clusterIdx = myGraphSpectralClustering(diphw2.d1a, 3)
clustImg = label2rgb(clusterIdx);
figure()
hold on
imshow(clustImg)

clusterIdx = myGraphSpectralClustering(diphw2.d1a, 4)
clustImg = label2rgb(clusterIdx);
figure()
hold on
imshow(clustImg)

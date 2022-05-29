%--------------------------------------------------------------------------
%                       Dimitrios Sourlantzis
%                Electrical and Computer Engineering
%                 Course:: Digital Image Processing
%--------------------------------------------------------------------------
function [bestNcut, bestMinElementsPerCluster] = findOptimalParameters(affinityMat, k)
% FINDOPTIMALPARAMETERS performs a grid search to determine the best normalized 
% cutting metric threshold and the optimal minimun amount of elements in 
% each cluster in order to achive k-cluster partition using normalized cutting.
%   @param affinityMat the affinity matrix of a graph
%   @param k how many clusters

    maxncut = 0.8:0.001:0.99;
    minele = 10:30;
    global minElementsPerCluster
    global maxNCutValue
    nCutValuesk6 = [];
    bestNcuts = [];
    bestMinElements = [];
    for i = 1:length(maxncut)
        for j = 1:length(minele)
            minElementsPerCluster = minele(j);
            maxNCutValue = maxncut(i);
            [superClusterIdxk6, ~] = myImageClustering(affinityMat, 1, nCutValuesk6);
            if length(unique(superClusterIdxk6)) == k
                bestNcuts = [bestNcuts maxncut(i)];
                bestMinElements = [bestMinElements minele(j)];
            end
        end
    end
    bestNcut = bestNcuts(1);
    bestMinElementsPerCluster = bestMinElements(1);
end

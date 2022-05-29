%--------------------------------------------------------------------------
%                       Dimitrios Sourlantzis
%                Electrical and Computer Engineering
%                 Course:: Digital Image Processing
%--------------------------------------------------------------------------
function [clusters, nCutValues] = myImageClustering(anAffinityMat, clusterId, nCutValues)
% MYIMAGECLUSTERING performs normalized cutting clustering of an image in a
% recursive manner
%   @param anAffinityMat the affinityMatrix of an image-graph
%   @param clusterId a list containing the ids, updated recursively
%   @param nCutValue a list containing nCut metrics, updated recursively

    global maxNCutValue;
    global minElementsPerCluster
    clusterIdx = myGraphSpectralClustering(anAffinityMat, 2);
    uniqueClasses = unique(clusterIdx);
    clusterA = clusterIdx == uniqueClasses(1);
    clusterB = clusterIdx == uniqueClasses(2);
    clusters = zeros(size(clusterIdx));
    nCutValue = calculateNcut(anAffinityMat,clusterIdx);
    
    if sum(clusterA) < minElementsPerCluster || sum(clusterB) < minElementsPerCluster...
        || nCutValue > maxNCutValue
        clusters(:) = clusterId;
        nCutValues = [nCutValues nCutValue];
        return
    end

    affinityMatTeamA = anAffinityMat(clusterA, clusterA); 
    affinityMatTeamB = anAffinityMat(clusterB, clusterB);
    
    [clusters1, nCutValues1] = myImageClustering(affinityMatTeamA, bitsll(clusterId,1), nCutValues);
    [clusters2, nCutValues2] = myImageClustering(affinityMatTeamB, bitsll(clusterId,1) + 1, nCutValues);  
    
    clusters(clusterA) = clusters1;
    clusters(clusterB) = clusters2;
    nCutValues = [nCutValues nCutValues1 nCutValues2];
end
    
%--------------------------------------------------------------------------
%                       Dimitrios Sourlantzis
%                Electrical and Computer Engineering
%                 Course:: Digital Image Processing
%--------------------------------------------------------------------------
function nCutValue = calculateNcut(anAffinityMat , clusterIdx)
%CALCULATENCUT calculates the ncut value of a graph partition
%   @anAffinityMat the affinity matrix of a graph
%   @param clusterIdx the cluster ids of every graph vertice.

    uniqueClasses = unique(clusterIdx);
    clusterA = find(clusterIdx == uniqueClasses(1));
    clusterB = find(clusterIdx == uniqueClasses(2));
    
    affinityMatTeamA = anAffinityMat(clusterA, clusterA); 
    affinityMatTeamB = anAffinityMat(clusterB, clusterB); 
    
    connectionAV = anAffinityMat(clusterA, :);
    connectionBV = anAffinityMat(clusterB, :);
    
    assocAA = sum(affinityMatTeamA, 'all');
    assocBB = sum(affinityMatTeamB, 'all');
    
    assocAV = sum(connectionAV, 'all');
    assocBV = sum(connectionBV, 'all');
    
    nCutValue = 2 - (assocAA/assocAV + assocBB/assocBV);
end


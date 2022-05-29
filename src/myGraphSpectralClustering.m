%--------------------------------------------------------------------------
%                       Dimitrios Sourlantzis
%                Electrical and Computer Engineering
%                 Course:: Digital Image Processing
%--------------------------------------------------------------------------
function clusterIdx = myGraphSpectralClustering(anAffinityMat , k)
%MYGRAPHSPECTRALCLUSTERING splits a graph in affinity matrix form 
%into k clusters 
%   @param anAffinityMat the affinity Matrix of a graph
%   @param k how many clusters
    realmin('single');
    D = diag(sum(anAffinityMat));
    L = D - anAffinityMat;
    [U, ~] = eigs(L,D,k,'smallestreal');
    clusterIdx = kmeans(U,k);
end


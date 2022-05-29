%--------------------------------------------------------------------------
%                       Dimitrios Sourlantzis
%                Electrical and Computer Engineering
%                 Course:: Digital Image Processing
%--------------------------------------------------------------------------
function myAffinityMat = SuperImage2Graph(superImage)
%IMAGE2GRAPH transform an image with superpixels to a graph in affinity matrix form
%   @param superImage the image with superpixels to transform

    [L, n] = size(superImage);
    myAffinityMat = double(zeros(L));
    superImage = im2double(superImage);
    for i = 1:L
        for j = 1:L
            total = 0;
            for k = 1:n
                total = total + (superImage(i,k)-superImage(j,k)).^2;
            end
            distance = sqrt(total);
            myAffinityMat(i, j) = exp(-distance);
        end
    end 
end


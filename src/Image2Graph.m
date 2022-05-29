%--------------------------------------------------------------------------
%                       Dimitrios Sourlantzis
%                Electrical and Computer Engineering
%                 Course:: Digital Image Processing
%--------------------------------------------------------------------------
function myAffinityMat = Image2Graph(I)
%IMAGE2GRAPH transform an image to a graph in affinity matrix form
%   @param I the image to transform

    [X, Y, n] = size(I);
    I = permute(I, [2 1 3]);
    Rows = reshape(im2double(I), [X*Y, n]);
    Columns = reshape(im2double(I), [X*Y, n]);
    myAffinityMat = zeros(X*Y);
    for i = 1:X*Y
        for j = 1:X*Y
            total = 0;
            for k = 1:n
                total = total + (Rows(i,k)-Columns(j,k))^2;
            end
            distance = sqrt(total);
            myAffinityMat(i, j) = exp(-distance);
        end
    end
end


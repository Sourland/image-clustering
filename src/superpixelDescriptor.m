%--------------------------------------------------------------------------
%                       Dimitrios Sourlantzis
%                Electrical and Computer Engineering
%                 Course:: Digital Image Processing
%--------------------------------------------------------------------------
function outputImage = superpixelDescriptor(imIn, labels)
%SUPERPIXELDESCRIPTOR A descriptor to find the color of every superpixel
%   @param imIn the initial normal image, used to describe every superpixel
%   @param labels a list indicating the superpixel every pixel belons to

    [X, Y, n] = size(imIn);
    superpixels = unique(labels);
    
    outputImage = im2double(zeros(X*Y, 1));
    imIn = reshape(imIn, [X*Y, 3]);
    
    for i = 1:size(superpixels, 1)        
        indexes = find(labels == superpixels(i));
        color = floor(mean(imIn(indexes,:), 'all')).*ones(length(indexes),1);
        outputImage(indexes,:) = color; 
    end
    outputImage = reshape(uint8(outputImage), [X, Y, 1]);
end


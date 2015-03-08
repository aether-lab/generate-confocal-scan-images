function IMAGE_OUT = scan_image_deformation(IMAGE_IN, A, B);
% Write what this function does!

% Size of the input images.
[height, width] = size(IMAGE_IN);

% Allocate the output image.
IMAGE_OUT = zeros(height, width);

% Pixel column indices
[x, y] = meshgrid(1 : width, 1 : height);

% Determine the columns where the pixels will be resampled.
% Make sure the column position doesn't fall outside the image domain.
cols = min(round(x+A*(x-1)+B*(y-1)), width);

% Loop over all the pixels.
for q = 1 : height  % number of rows
    for n = 1 : width %number of columns
            IMAGE_OUT(q, cols(q, n)) = double(IMAGE_IN(q,n)); %Delay is applied accordingly, with respect to positions
    end
end
    
end
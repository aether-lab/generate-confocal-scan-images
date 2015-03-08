function OUTPUT_IMAGE = generate_confocal_scan_image(INPUT_IMAGE, KERNEL_SIZE, A, B);
% Write what this function does!

% Scan image deformation
scanned_image = scan_image_deformation(INPUT_IMAGE, A, B);

% Specify the kernel filter
kernel_filter = ones(KERNEL_SIZE);
kernel_filter = kernel_filter ./ length(kernel_filter(:));

% Convolve the image with the moving-average filter.
OUTPUT_IMAGE = conv2(kernel_filter, scanned_image);
    
end
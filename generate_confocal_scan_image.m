function OUTPUT_IMAGE = generate_confocal_scan_image(INPUT_IMAGE, KERNEL_SIZE, A, B);
% Write what this function does!

% Scan image deformation
scanned_image = scan_image_deformation(INPUT_IMAGE, A, B);

% Specify the kernel filter
kernel_filter = ones(KERNEL_SIZE) ./ KERNEL_SIZE^2;

% Convolve the image with the moving-average filter.
OUTPUT_IMAGE = conv2(scanned_image, kernel_filter, 'same');
    
end
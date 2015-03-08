
function generate_confocal_scan_image_script

% Image Directory for Test Case Images (TAA)
basedir  = '~/Desktop/vortex/analysis/data/synthetic/vortex/lamb_vortex_diffusion_large/c_0.0250/lambvortex_h128_w512_00001/raw';
Ntotal   = 500;
imstart = 1;
imfstep  = 1;    
im_base  = 'lambvortex_h128_w512_'; 

% Save directory.
save_dir ='~/Desktop/scan_images';

% Number of digits in input image names.
num_digits = 6;

% Extension of input images
image_extension = '.tiff';

% Scan constants.
% delay will be divided by 5 for accounting the high resolution matrix
%A = zeros(1,Ntotal);
A = 0.00012*5; %(pixel scan time delay for uniform speed of U=100um/s)
B = 0.16125*5; %(line scan time delay for uniform speed of U=100um/s)

% Dimensions of the spatial-average convolution kernel.
kernel_dims = [5, 5];

% "num2string" number format for input images.
number_format = ['%0' num2str(num_digits) 'd'];

% Create the output directory if it doesn't already exist.
if ~exist(save_dir, 'dir')
   mkdir(save_dir) 
end

% Start a timer.
timer_01 = tic;
parfor t=imstart:imfstep:Ntotal
    
    % Image name
    imname = fullfile(basedir,[im_base,num2str(t,number_format), image_extension]);  %default was %05d
    INPUT_IMAGE = double(imread(imname));
    
    % Start processing images
    OUTPUT_IMAGE = generate_confocal_scan_image(INPUT_IMAGE, kernel_dims, A, B);
    
    % Save the image
    imwrite(uint16(OUTPUT_IMAGE),fullfile(save_dir,['AIO_S120_N_',num2str(t,'%01d'), image_extension]));

end

% End the timer.
toc(timer_01);

end




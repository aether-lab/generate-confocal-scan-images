function compile_scan_image_deformation();

% Example variables
A = 1.00;
B = 1.00;
IMAGE_IN = coder.typeof(1.00, [inf, inf]);

% Set up the coder configuration
cfg = coder.config('mex');
cfg.DynamicMemoryAllocation = 'AllVariableSizeArrays';
cfg.GenerateReport = true;

% Run coder to generate the mex file.
codegen -config cfg scan_image_deformation -args {IMAGE_IN, A, B};

end
function metrics = quality_metrics(I)
% Compute six fundus quality measurements from one image.

    if ndims(I) == 2
        I = repmat(I, [1 1 3]);
    end

    I = im2double(I);
    gray = rgb2gray(I);

    % 1. FIELD OF VIEW
    mask = gray > 0.05;
    mask = bwareaopen(mask, 500);

    if any(mask(:))
        mask = bwareafilt(mask, 1);
    end

    mask = imclose(mask, strel('disk', 5));
    mask = imfill(mask, 'holes');

    FOVScore = nnz(mask) / numel(mask);

    % 2. FOCUS SCORE
    laplacianKernel = [0 1 0; 1 -4 1; 0 1 0];

    laplacianImage = imfilter( ...
        gray, laplacianKernel, 'replicate');

    laplacianValues = laplacianImage(mask);

    if isempty(laplacianValues)
        FocusScore = NaN;
    else
        FocusScore = var(laplacianValues);
    end

    % 3-6. BRIGHTNESS METRICS
    retinalPixels = gray(mask);

    if isempty(retinalPixels)
        MeanBrightness = NaN;
        BrightnessStd = NaN;
        DarkFraction = NaN;
        BrightFraction = NaN;
    else
        MeanBrightness = mean(retinalPixels);
        BrightnessStd = std(retinalPixels);
        DarkFraction = mean(retinalPixels < 0.08);
        BrightFraction = mean(retinalPixels > 0.95);
    end

    metrics = struct( ...
        'FOVScore', FOVScore, ...
        'FocusScore', FocusScore, ...
        'MeanBrightness', MeanBrightness, ...
        'BrightnessStd', BrightnessStd, ...
        'DarkFraction', DarkFraction, ...
        'BrightFraction', BrightFraction ...
    );
end

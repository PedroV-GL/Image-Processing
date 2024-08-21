image = 'path of the File. type of archive';
% Attempt to load the NIR band

try nirBand = imread(image);
    disp('Image successfully loaded.');

    % Display the Near-Infrared (NIR) band
    figure, imshow(nirBand, []), title('NIR Band');
end

% Normalize the image to the range [0, 1]

nirNorm = double(nirBand) / double(max(nirBand(:)));
% Apply a Sobel filter to detect edges in the full image

edgesFull = edge(nirNorm, 'sobel');

% Remove small objects using a morphological operation

se = strel('disk', 2);
cleanedEdgesFull = imopen(edgesFull, se);

% Fill internal areas in the detected edges

filledEdgesFull = imfill(cleanedEdgesFull, 'holes');

% Find the contours of the detected areas

contoursFull = bwboundaries(filledEdgesFull, 'noholes');

% Display the original image with the contours overlaid

figure, imshow(nirNorm), title('Overlaid Contours');
hold on;
for k = 1:length(contoursFull)
    boundary = contoursFull{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2);
end
hold off;

% Display the image for analysis
figure;
imshow(edgesFull);
title('Edge Detection (Sobel) on the Full Image');

%% Apply the Region of Interest (ROI) to the image
roiPosition = [13041 7253 1000 1000]; % [pos(x) pos(y) width height]
% Extract the ROI
myROI = nirBand(roiPosition(2):(roiPosition(2) + roiPosition(4)), roiPosition(1):(roiPosition(1) + roiPosition(3)));
% Normalize the ROI to the range [0, 1]
nirNormROI = double(myROI) / double(max(myROI(:)));

% Apply a Sobel filter to detect edges in the ROI
edgesROI = edge(nirNormROI, 'sobel');
% Remove small objects using a morphological operation
cleanedEdgesROI = imopen(edgesROI, se);

% Fill internal areas in the detected edges
filledEdgesROI = imfill(cleanedEdgesROI, 'holes');

% Find the contours of the detected areas in the ROI
contoursROI = bwboundaries(filledEdgesROI, 'noholes');
% Display the original ROI with the contours overlaid
figure, imshow(nirNormROI);
hold on;
for k = 1:length(contoursROI)
    boundary = contoursROI{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2);
end
hold off;
% Display the ROI with edge detection
figure;
imshow(edgesROI);
title('Edge Detection (Sobel) on the ROI');

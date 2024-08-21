# Water Detection Algorithm using Sobel Filter and NIR Band

This MATLAB script highlights the presence of water by enhancing the contrast between water and other terrain features. The script uses a Sobel filter to detect edges, which are further processed to highlight water bodies. Additionally, the script allows for region-of-interest (ROI) processing to focus on specific areas of the image.

## Features

- **Image Preprocessing**: The NIR (Near-Infrared) band image is normalized to the range [0, 1].
- **Edge Detection**: The Sobel filter is applied to the entire image and to a specific ROI for edge detection.
- **Morphological Operations**: Small objects are removed, and internal regions within detected edges are filled.
- **Contours Overlay**: Detected edges are overlaid on the original image and the ROI for better visualization.
- **Region of Interest (ROI)**: A custom ROI can be applied to focus the analysis on a specific area.

## Prerequisites

- MATLAB R2021b or higher
- Image Processing Toolbox

## How to Use

1. **Input Image**: Set the path of the input NIR band image in the variable `image`.
2. **Run the Script**: Run the script in MATLAB.
3. **Visualization**: The script will display the following results:
   - Original NIR band image
   - Sobel edge detection on the full image
   - Sobel edge detection on a region of interest (ROI)
   - Contours overlaid on both the full image and ROI

## Customization

- **ROI Selection**: Modify the `roiPosition` variable to analyze a different region of the image.
- **Sobel Filter Parameters**: You can tweak the parameters of the `edge` function to fine-tune edge detection.
- **Morphological Operations**: The size and shape of the structuring element (`se`) can be changed to refine the removal of small objects.

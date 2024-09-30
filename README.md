Pulmonary Nodules Data Analysis and Classification

Introduction. Visualization, Detection & Segmentation

Exercise 1. Visualization of 3D Volumes. Download the materials to a local folder, launch Spyder 5 from Desktop and open S1_Visualization.py. Set the variables SessionPyFolder, SessionDataFolder to your local path. Otherwise, use Slicer3D available at https://www.slicer.org.
a) Use the interactive visualization routines to browse though the volumes. What are intensity values for the lungs, soft tissue, bones and pulmonary lesion?
b) WhatSAcutsshowalesion?HowmanylesionsdoesLIDC-IDRI-0003have?
c)Install the Slicer3D software available at https://www.slicer.org and visualize lesions of the LIDC-IDRI-0003 case.

Exercise 2. Generate ROIs
a)  Use the mask to generate the bounding boxes. You can use Pyradiomics’ Imageoperations’ checkMask(). Install it using: pip install pyradiomics==3.0.1.
b)  Use the affine matrix to convert the bounding box coordinates of the metadata file to voxel coordinates. More information about it can be found at: https://nipy.org/nibabel/coordinate_systems.html

Exercise 3. Lesion Segmentation. Load and visualize one of the lesion ROIs.
a)  Set a value for thresholding, segment the lesion and visualize the segmentation
b)  Use the threshold setina to segment the remaining lesions. Discuss the quality of the results
c)  Define your own ROIs from the whole volume and segment the lesion using the threshold defined in a). Discuss the quality of the results

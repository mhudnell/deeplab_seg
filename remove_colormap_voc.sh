# Remove the colormap in the ground truth annotations.

DEEPLAB_DIR="C:/Users/Max/repos/tensorflow/models/research/deeplab"
VOC_DIR="F:/datasets/VOCdevkit/VOC2012"
SEG_FOLDER="${VOC_DIR}/SegmentationClass"
SEG_FOLDER_RAW="${VOC_DIR}/SegmentationClassRaw"

echo "Removing the color map in ground truth annotations..."
python ${DEEPLAB_DIR}/datasets/remove_gt_colormap.py \
  --original_gt_folder="${SEG_FOLDER}" \
  --output_dir="${SEG_FOLDER_RAW}"
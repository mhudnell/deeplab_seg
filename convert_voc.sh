# Build TFRecords of the dataset.
#run from /segmentation 


DEEPLAB_DIR="C:/Users/Max/repos/tensorflow/models/research/deeplab"
# VOC_DIR="F:/datasets/VOCdevkit/VOC2012"
VOC_DIR="F:/datasets/VOCdevkit/VOC2010"

IMAGE_FOLDER="${VOC_DIR}/JPEGImages"

# LIST_FOLDER="${VOC_DIR}/ImageSets/Segmentation"   # VOC2012
LIST_FOLDER="${VOC_DIR}/ImageSets/SegmentationPart" # VOC2010

# # VOC2012
# # SEG_FOLDER="${VOC_DIR}/SegmentationClass"
# SEG_FOLDER="${VOC_DIR}/SegmentationClassRaw"

# VOC2010
# SEG_FOLDER="${VOC_DIR}/SegmentationClass"
SEG_FOLDER="${VOC_DIR}/SegmentationPart"

# First, create output directory for storing TFRecords.
DATASET_DIR="datasets"
# PASCAL_FOLDER="pascal_voc_seg"    # VOC2012
PASCAL_FOLDER="pascal_voc_seg_part_2010" # VOC2010
OUTPUT_DIR="${DATASET_DIR}/${PASCAL_FOLDER}/tfrecord"
mkdir -p "${OUTPUT_DIR}"

echo "Converting PASCAL VOC dataset..."
python ${DEEPLAB_DIR}/datasets/build_voc2012_data.py \
  --image_folder="${IMAGE_FOLDER}" \
  --semantic_segmentation_folder="${SEG_FOLDER}" \
  --list_folder="${LIST_FOLDER}" \
  --image_format="jpg" \
  --output_dir="${OUTPUT_DIR}"

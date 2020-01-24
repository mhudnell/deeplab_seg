# run from /segmentation 

#WORK_DIR="C:\Users\Max\repos\segmentation"
TF_MODELS_RESEARCH_DIR="C:/Users/Max/repos/tensorflow/models/research"
DEEPLAB_DIR="C:/Users/Max/repos/tensorflow/models/research/deeplab"

# Update PYTHONPATH. ## not needed, set this with conda every time deeplab env is activated --mh 12.23.19
# export PYTHONPATH=$PYTHONPATH:${TF_MODELS_RESEARCH_DIR}:${TF_MODELS_RESEARCH_DIR}/slim
# export PYTHONPATH="${TF_MODELS_RESEARCH_DIR};${TF_MODELS_RESEARCH_DIR}/slim"

# Set up the working directories.
DATASET_DIR="datasets"
# PASCAL_FOLDER="pascal_voc_seg"    # VOC2012
PASCAL_FOLDER="pascal_voc_seg_part_2010" # VOC2010
EXP_FOLDER="exp/train_on_train_set"
INIT_FOLDER="${DATASET_DIR}/${PASCAL_FOLDER}/init_models"
TRAIN_LOGDIR="${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train"
EVAL_LOGDIR="${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/eval"
VIS_LOGDIR="${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/vis"
EXPORT_DIR="${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/export"
mkdir -p "${INIT_FOLDER}"
mkdir -p "${TRAIN_LOGDIR}"
mkdir -p "${EVAL_LOGDIR}"
mkdir -p "${VIS_LOGDIR}"
mkdir -p "${EXPORT_DIR}"

PASCAL_DATASET="${DATASET_DIR}/${PASCAL_FOLDER}/tfrecord"


# Run evaluation. This performs eval over the full val split (1449 images) and
# will take a while.
python ${DEEPLAB_DIR}/eval.py \
  --logtostderr \
  --eval_split="val" \
  --model_variant="xception_65" \
  --atrous_rates=6 \
  --atrous_rates=12 \
  --atrous_rates=18 \
  --output_stride=16 \
  --decoder_output_stride=4 \
  --eval_crop_size="513,513" \
  --checkpoint_dir="${TRAIN_LOGDIR}" \
  --eval_logdir="${EVAL_LOGDIR}" \
  --dataset_dir="${PASCAL_DATASET}" \
  --max_number_of_evaluations=10
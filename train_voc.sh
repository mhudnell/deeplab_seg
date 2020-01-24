# tests training of model
# run from /segmentation 

#WORK_DIR="C:\Users\Max\repos\segmentation"
TF_MODELS_RESEARCH_DIR="C:/Users/Max/repos/tensorflow/models/research"
DEEPLAB_DIR="C:/Users/Max/repos/tensorflow/models/research/deeplab"

# Update PYTHONPATH.
# export PYTHONPATH=$PYTHONPATH:${TF_MODELS_RESEARCH_DIR}:${TF_MODELS_RESEARCH_DIR}/slim
export PYTHONPATH="${TF_MODELS_RESEARCH_DIR};${TF_MODELS_RESEARCH_DIR}/slim"

echo PYTHONPATH:${PYTHONPATH}

# Set up the working directories.
DATASET_DIR="datasets"
PASCAL_FOLDER="pascal_voc_seg"
EXP_FOLDER="exp/train_on_trainval_set"
INIT_FOLDER="${DATASET_DIR}/${PASCAL_FOLDER}/init_models"
TRAIN_LOGDIR="${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/train"
EVAL_LOGDIR="${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/eval"  #C:/Users/Max/repos/segmentation/datasets/pascal_voc_seg/exp/train_on_trainval_set/eval
VIS_LOGDIR="${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/vis"
EXPORT_DIR="${DATASET_DIR}/${PASCAL_FOLDER}/${EXP_FOLDER}/export"
mkdir -p "${INIT_FOLDER}"
mkdir -p "${TRAIN_LOGDIR}"
mkdir -p "${EVAL_LOGDIR}"
mkdir -p "${VIS_LOGDIR}"
mkdir -p "${EXPORT_DIR}"

PASCAL_DATASET="${DATASET_DIR}/${PASCAL_FOLDER}/tfrecord"

echo TRAIN_LOGDIR:${TRAIN_LOGDIR}

# Train 10 iterations.
# deafult train_batch_size=4
# default tf_initial_checkpoint="${INIT_FOLDER}/deeplabv3_pascal_train_aug/model.ckpt"
NUM_ITERATIONS=1
python ${DEEPLAB_DIR}/train.py \
  --logtostderr \
  --train_split="trainval" \
  --model_variant="xception_65" \
  --atrous_rates=6 \
  --atrous_rates=12 \
  --atrous_rates=18 \
  --output_stride=16 \
  --decoder_output_stride=4 \
  --train_crop_size="513,513" \
  --train_batch_size=1 \
  --training_number_of_steps="${NUM_ITERATIONS}" \
  --fine_tune_batch_norm=true \
  --tf_initial_checkpoint="${INIT_FOLDER}/deeplabv3_pascal_trainval/model.ckpt" \
  --train_logdir="${TRAIN_LOGDIR}" \
  --dataset_dir="${PASCAL_DATASET}"

# # Run evaluation. This performs eval over the full val split (1449 images) and
# # will take a while.
# # Using the provided checkpoint, one should expect mIOU=82.20%.
# #default checkpoint_dir: "${TRAIN_LOGDIR}"  # "${INIT_FOLDER}/deeplabv3_pascal_train_aug"
# #
# python ${DEEPLAB_DIR}/eval.py \
#   --logtostderr \
#   --eval_split="val" \
#   --model_variant="xception_65" \
#   --atrous_rates=6 \
#   --atrous_rates=12 \
#   --atrous_rates=18 \
#   --output_stride=16 \
#   --decoder_output_stride=4 \
#   --eval_crop_size="513,513" \
#   --checkpoint_dir="${TRAIN_LOGDIR}" \
#   --eval_logdir="${EVAL_LOGDIR}" \
#   --dataset_dir="${PASCAL_DATASET}" \
#   --max_number_of_evaluations=1

# # Visualize the results.
# python ${DEEPLAB_DIR}/vis.py \
#   --logtostderr \
#   --vis_split="val" \
#   --model_variant="xception_65" \
#   --atrous_rates=6 \
#   --atrous_rates=12 \
#   --atrous_rates=18 \
#   --output_stride=16 \
#   --decoder_output_stride=4 \
#   --vis_crop_size="513,513" \
#   --checkpoint_dir="${TRAIN_LOGDIR}" \
#   --vis_logdir="${VIS_LOGDIR}" \
#   --dataset_dir="${PASCAL_DATASET}" \
#   --max_number_of_iterations=1

# # Export the trained checkpoint.
# CKPT_PATH="${TRAIN_LOGDIR}/model.ckpt-${NUM_ITERATIONS}"
# EXPORT_PATH="${EXPORT_DIR}/frozen_inference_graph.pb"

# python ${DEEPLAB_DIR}/export_model.py \
#   --logtostderr \
#   --checkpoint_path="${CKPT_PATH}" \
#   --export_path="${EXPORT_PATH}" \
#   --model_variant="xception_65" \
#   --atrous_rates=6 \
#   --atrous_rates=12 \
#   --atrous_rates=18 \
#   --output_stride=16 \
#   --decoder_output_stride=4 \
#   --num_classes=21 \
#   --crop_size=513 \
#   --crop_size=513 \
#   --inference_scales=1.0

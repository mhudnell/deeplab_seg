# TODO
## TODO1: setting up the dataset for training
1. run remove_colormap_voc.sh
  - make sure to point `DEEPLAB_DIR` and `VOC_DIR` to the correct locations on your system (check this for all of these scripts)
2. run convert_voc.sh to produce the tfrecord
  - note: looks like this is currently set up to produce the tfrecord for the Person-Part subset, try commenting / uncommenting certain lines to run this on the general VOC dataset first

## TODO2: try evaluating a pretrained model
1. use `${DEEPLAB_DIR}/eval.py` script to evaluate a pretrained model (see example usage in my `eval_voc.sh`). you should get good evaluation scores.
  - note: pretrained models can be found [here](https://github.com/tensorflow/models/blob/master/research/deeplab/g3doc/model_zoo.md) (we want the ones trained on PASCAL VOC 2012). try the one named 'xception65_coco_voc_trainval'.

## TODO3: attempt training the pretrained model
1. run train_voc.sh (loads a pretrained model, attempts to continue training on the VOC dataset's tfrecord we generated above)
2. run eval_voc.sh to test inference after training
  - note: my scores (shown in `eval_results.txt`) show how most classes went to 0 accuracy after I attempted to continue training)

## TODO4 (the dream): train on the VOC Person-part subset (maybe from scratch? / but probably using a checkpoint already trained on VOC)

# setup stuff
## setup environment

1. create conda environment 'deeplab'
2. install tensorflow/research repo
3. set conda environment variable for PYTHONPATH (https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#saving-environment-variables)


## running jupyter

jupyter notebook --notebook-dir="C:/Users/Max/repos"

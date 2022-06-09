# A Study of Person Re-Identification Base on Deep Convolutional Neural Network with Split-Attention Block

# Requirement
## Environment
- Ubuntu 18.04
- Python 3.7
- Pytorch 1.9.1
- NVIDIA CUDA 11.4
```bash
$ git clone https://github.com/sksksk1748/BDB-ResNeSt.git

$ conda create --name py37_bdn python=3.7
$ conda activate py37_bdn

$ cd BDB-ResNeSt

$ pip install requirements.txt 

# 執行 initialization.sh 部屬 dataset
$ sudo chmod 777 initialization.sh
$ ./initialization.sh
```

## Hardware
- i7-11700K
- GIGABYTE RTX 3090 24GB
- 64GB RAM 

## Dataset
- If `initialization.sh` can’t download the dataset, download it manually.
    - [Marker-1501](https://www.kaggle.com/pengcw1/market-1501/data)
    - [cuhk03-np](https://github.com/zhunzhong07/person-re-ranking/tree/master/CUHK03-NP)
    - [DukeMTMC-reID](https://drive.google.com/file/d/1jjE85dRCMOgRtvJ5RQV9-Afs-2_5dY3O/view)


## Your `~/BDB-ResNeSt/` folder should look like this
```
BDB-ResNeSt
├── data/ 
│   └── market1501/ cuhk-detect/ cuhk-label/ dukemtmc-reid ...
│       ├── bounding_box_train/
│       │   └── images.jpg
│       ├── bounding_box_test/
│       │   └── images.jpg
│       └── query/
│           └── images.jpg 
│
├── models/
├── pytorch-ckpt/
├── utils/
├── datasets/
├── trainers/
└── ...
```


# Usage
- Training & Evaluate
    - [link](./training.md)
- Generate the Rank-10 list for the query images
    - [link](./query.md)
- Generate the feature map for different erased height ratio
    - [link](./featureMap.md)
- tensorboad on local
```bash
$ tensorboard --logdir=./tensorboard_log
```
- tensorboad on server
```bash
$ tensorboard --logdir=./tensorboard_log --host= your ip address (example==>123.456.789.xxx)
```

# Reference
- paper
    - [Batch DropBlock Network for Person Re-identification and Beyond](https://arxiv.org/abs/1811.07130)
    - [ResNeSt: Split-Attention Networks](https://arxiv.org/abs/2004.08955)
- implement
    - [batch-dropblock-network](https://github.com/daizuozhuo/batch-dropblock-network)
    - [ResNeSt](https://github.com/zhanghang1989/ResNeSt)
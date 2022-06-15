# A Study of Person Re-Identification Base on Deep Convolutional Neural Network with Split-Attention Block

# Requirement
## Environment
- Ubuntu 18.04
- Python 3.7
- Pytorch 1.9.1
- [NVIDIA cuDNN v8.2.2 (July 6th, 2021), for CUDA 11.4](https://developer.nvidia.com/compute/machine-learning/cudnn/secure/8.2.2/11.4_07062021/cudnn-11.4-linux-x64-v8.2.2.26.tgz)
- [NVIDIA CUDA 11.4 (cuda_11.4.0_470.42.01_linux)](https://developer.nvidia.com/cuda-11-4-0-download-archive?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=18.04&target_type=runfile_local)
```bash
$ git clone https://github.com/sksksk1748/BDB-ResNeSt.git

$ conda create --name py37_bdn python=3.7
$ conda activate py37_bdn

$ cd BDB-ResNeSt

$ pip install torch==1.9.1+cu111 torchvision==0.10.1+cu111 torchaudio==0.9.1 -f https://download.pytorch.org/whl/torch_stable.html

$ pip install -r requirements.txt 

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
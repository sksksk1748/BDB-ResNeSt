#!/bin/bash
mkdir data
cd data
# market1501 dataset
gdown https://drive.google.com/u/0/uc?id=0B8-rUzbwVRk0c054eEozWG9COHM
# DukeMTMC-reID dataset
gdown https://drive.google.com/u/0/uc?id=1jjE85dRCMOgRtvJ5RQV9-Afs-2_5dY3O
# CUHK03-NP dataset
gdown https://drive.google.com/u/0/uc?id=1pBCIAGSZ81pgvqjC-lUHtl0OYV1icgkz
unzip Market-1501-v15.09.15.zip
unzip cuhk03-np.zip
unzip DukeMTMC-reID.zip

rm -r __MACOSX/
mv Market-1501-v15.09.15 market1501
mv DukeMTMC-reID dukemtmc-reid
sudo mv cuhk03-np/labeled ./cuhk-label
sudo mv cuhk03-np/detected ./cuhk-detect
rm -r cuhk03-np

cd market1501
rm -r gt_bbox
rm -r gt_query
rm -r readme.txt
cd ..
cd dukemtmc-reid
rm -r CITATION.txt
rm -r LICENSE_DukeMTMC-reID.txt
rm -r LICENSE_DukeMTMC.txt
rm -r README.md

#!/bin/bash

apt install -y git
git clone https://github.com/AlexEMG/DeepLabCut.git
apt install -y wget
mkdir tmp
cd tmp
wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
bash Anaconda3-2019.10-Linux-x86_64.sh
source ../.bashrc
cd ../DeepLabCut/conda-environments/
conda env create -f dlc-ubuntu-GPU.yaml # sometimes long pause after `execute environement : done`
source activate dlc-ubuntu-GPU
cd ~
git clone https://github.com/rckoepke/dog_training_NN

config_path = '/root/dog_training_NN/DogTrain1-rckoepke-2019-12-04/config.yaml'

deeplabcut.train_network(config_path,shuffle=1,trainingsetindex=0,gputouse=None,max_snapshots_to_keep=5,autotune=False,displayiters=100,saveiters=15000, maxiters=30000)

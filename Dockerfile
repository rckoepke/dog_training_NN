FROM tensorflow/tensorflow:1.13.2-gpu
MAINTAINER Ross Koepke <koepke@gmail.com>

RUN apt install -y git
RUN git clone https://github.com/AlexEMG/DeepLabCut.git
RUN apt install -y wget
RUN mkdir ~/tmp
RUN cd ~/tmp
RUN wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
RUN bash Anaconda3-2019.10-Linux-x86_64.sh
RUN source ../.bashrc
RUN cd ../DeepLabCut/conda-environments/
RUN conda env create -f dlc-ubuntu-GPU.yaml # sometimes long pause after `execute environement : done`
RUN source activate dlc-ubuntu-GPU
RUN cd ~
RUN git clone https://github.com/rckoepke/dog_training_NN

RUN config_path = '/root/dog_training_NN/DogTrain1-rckoepke-2019-12-04/config.yaml'

RUN deeplabcut.train_network(config_path,shuffle=1,trainingsetindex=0,gputouse=None,max_snapshots_to_keep=5,autotune=False,displayiters=100,saveiters=15000, maxiters=30000)

CMD ["/bin/bash"]

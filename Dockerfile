FROM tensorflow/tensorflow:1.13.2-gpu
MAINTAINER Ross Koepke <koepke@gmail.com>

RUN apt-get update && apt install --fix-missing -y git wget
RUN git clone https://github.com/AlexEMG/DeepLabCut.git /root/DeepLabCut/
RUN mkdir ~/tmp
RUN wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -P /root/tmp/
RUN bash /root/tmp/Anaconda3-2019.10-Linux-x86_64.sh -b -p /root/anaconda3 && eval "$(/root/anaconda3/bin/conda shell.bash hook)" && conda init && source /root/.bashrc && conda env create -f /root/DeepLabCut/conda-environments/dlc-ubuntu-GPU.yaml && source activate dlc-ubuntu-GPU
#RUN ["conda", "init"] #https://stackoverflow.com/questions/55090293/the-command-bin-sh-c-conda-update-conda-returned-a-non-zero-code-127
#RUN source /root/.bashrc && conda env create -f /root/DeepLabCut/conda-environments/dlc-ubuntu-GPU.yaml # sometimes long pause after `execute environment : done`
#RUN source activate dlc-ubuntu-GPU
RUN explort DLClight=TRUE
CMD ["/bin/bash"]

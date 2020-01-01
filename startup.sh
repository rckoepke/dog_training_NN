eval "$(/root/anaconda3/bin/conda shell.bash hook)"
source activate dlc-ubuntu-GPU
git clone https://github.com/rckoepke/dog_training_NN.git
export DLClight=True
touch "~/startupworked"
ipython startup.py

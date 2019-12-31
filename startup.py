f=open("status.txt","w+")
from datetime import datetime

import os
f.write("import os: "+str(datetime.now()))
file.flush()
os.fsync(file.fileno())

os.environ['DLClight'] = True
f.write("os.environ['DLClight'] = True: "+str(datetime.now()))
file.flush()
os.fsync(file.fileno())

config_path = '/root/dog_training_NN/DogTrain2-rckoepke-2019-12-10/config.yaml'
f.write("config_path = '/root/dog_training_NN/DogTrain2-rckoepke-2019-12-10/config.yaml': "+str(datetime.now()))
file.flush()
os.fsync(file.fileno())

import deeplabcut
f.write("import deeplabcut: "+str(datetime.now()))
file.flush()
os.fsync(file.fileno())

deeplabcut.analyze_videos(config_path,['/root/dog_training_NN/DogTrain2-rckoepke-2019-12-10/DogTrain1-Fixed.mp4'], videotype='.mp4', save_as_csv=True)
f.write("deeplabcut.analyze_videos(config_path,['/root/dog_training_NN/DogTrain2-rckoepke-2019-12-10/DogTrain1-Fixed.mp4'], videotype='.mp4', save_as_csv=True)"+str(datetime.now()))
file.flush()
os.fsync(file.fileno())

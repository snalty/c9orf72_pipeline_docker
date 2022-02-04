FROM nvidia/cuda:11.3.0-base-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install git python3.8 python3.8-dev python3.8-venv build-essential -y

WORKDIR /home/root/

RUN git clone https://github.com/snalty/bonito.git --single-branch --branch sam && echo "a"

RUN python3 -m venv pipeline_env

RUN /home/root/pipeline_env/bin/pip install --upgrade pip

# Have to install this as an extra step for some reason 
RUN /home/root/pipeline_env/bin/pip install torch==1.10.0+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html

RUN /home/root/pipeline_env/bin/pip install wheel 

RUN /home/root/pipeline_env/bin/pip install -e ./bonito 
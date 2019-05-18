# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
#FROM winowang/jupyter_images:jupyter-latest
FROM winowang/jupyter_gpu:latest
#FROM winowang/dockerfile_test:cuda92-latest

LABEL maintainer="Jupyter Pytorch"

USER root

RUN conda install --yes \
    'qt=5.9.*' \
    'pyqt=5.9.*'

# pytorch  
# please vist the URL(https://pytorch.org/) to check more verions for cpu or gpu
#RUN conda install --quiet --yes pytorch torchvision cuda90 -c pytorch && \

#RUN conda install --quiet --yes pytorch torchvision cuda92 -c pytorch && \
# pytorch 1.1
#RUN apt-get update && apt-get -yq dist-upgrade \
#    && apt-get install -yq --no-install-recommends \
#    python3-pip    
#RUN pip3 install torch torchvision && \
RUN conda install --quiet --yes -c pytorch  pytorch && \
 
# Pytorch 0.4.1
#RUN conda install --quiet --yes pytorch=0.4.1 torchvision cuda92 -c pytorch && \

# Pytorch CPU
#RUN conda install --quiet --yes pytorch-cpu torchvision-cpu -c pytorch && \
    conda remove --quiet --yes --force qt pyqt && \
    conda clean -tipsy && \
    npm cache clean --force && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/.cache/yarn && \
    rm -rf /home/.node-gyp
    
RUN conda install --yes \
          'opencv=3.4*'

RUN pip install tensorboardX
#RUN pip install git+https://github.com/lanpa/tensorboardX

# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM Winowang/jupyter_images:latest

LABEL maintainer="Jupyter Pytorch"

USER root

RUN conda install --yes \
    'qt=5.9.*' \
    'pyqt=5.9.*'

# pytorch  
# please vist the URL(https://pytorch.org/) to check more verions for cpu or gpu
#RUN conda install --quiet --yes pytorch torchvision cuda91 -c pytorch && \
RUN conda install --quiet --yes pytorch-cpu torchvision-cpu -c pytorch && \
    conda remove --quiet --yes --force qt pyqt && \
    conda clean -tipsy && \
    npm cache clean --force && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/.cache/yarn && \
    rm -rf /home/.node-gyp

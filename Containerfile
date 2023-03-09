FROM docker.io/debian:11.3
LABEL authors="Kosmas Hench" \
      description="Container containing software for the modelling and infernence of demographic histories"

# setting up conda
RUN apt update && apt install -y wget procps
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh && \
    bash Miniconda3-py39_4.12.0-Linux-x86_64.sh -b -p /miniconda

ENV PATH ${PATH}:/miniconda/bin

# install mamba for fast installation and set up channels
RUN conda install mamba -y -n base -c conda-forge
RUN conda config --add channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge

# install packages available via conda
COPY env.yml /
RUN mamba env create -f /env.yml && conda clean -a

# install est-sfs manually
RUN apt install -y git
RUN mkdir -p /manual_install/bin && \
    cd /manual_install && \
    git clone https://github.com/isaacovercast/easySFS.git && \
    cd easySFS && \
    chmod 777 easySFS.py && \
    cd ../bin && \
    ln ../easySFS/*.py ./

ENV PATH ${PATH}:/miniconda/envs/popsim_suite/bin:/manual_install/bin
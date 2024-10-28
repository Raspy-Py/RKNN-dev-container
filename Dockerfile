FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Install Python 3.6 and dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
    libgl1 \
    python3.6 \
    python3.6-dev \
    python3.6-distutils \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install pip for Python 3.6
RUN wget https://bootstrap.pypa.io/pip/3.6/get-pip.py && \
    python3.6 get-pip.py && \
    rm get-pip.py

# Create working directory
WORKDIR /app

# Copy and install requirements
COPY requirements.txt .
RUN python3.6 -m pip install -r requirements.txt

# Download, extract and install RKNN Toolkit
RUN wget https://github.com/rockchip-linux/rknn-toolkit/releases/download/v1.7.0/rknn-toolkit-v1.7.0-packages.zip 

RUN apt-get update && \
    apt-get install -y gcc libffi-dev && \
    rm -rf /var/lib/apt/lists/*

RUN unzip rknn-toolkit-v1.7.0-packages.zip && \
    python3.6 -m pip install packages/rknn_toolkit-1.7.0-cp36-cp36m-linux_x86_64.whl && \
    rm -rf rknn-toolkit-v1.7.0-packages.zip packages

CMD ["/bin/bash"]
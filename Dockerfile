FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3.9 \
    python3-pip \
    libgl1-mesa-glx \
    libglib2.0-0 \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3.9 as the default python
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

# Upgrade pip
RUN python3 -m pip install --no-cache-dir --upgrade pip

# Create a directory for downloads
RUN mkdir -p /root/downloads

# Copy requirements file
COPY requirements.txt /root/downloads/

# Install other Python packages
RUN pip3 install --no-cache-dir -r /root/downloads/requirements.txt

# Download RKNN Toolkit wheel file
RUN wget https://github.com/rockchip-linux/rknn-toolkit2/raw/v1.6.0/rknn-toolkit2/packages/rknn_toolkit2-1.6.0%2B81f21f4d-cp39-cp39-linux_x86_64.whl -O /root/downloads/rknn_toolkit2-1.6.0+81f21f4d-cp39-cp39-linux_x86_64.whl

# Install RKNN Toolkit
RUN pip3 install /root/downloads/rknn_toolkit2-1.6.0+81f21f4d-cp39-cp39-linux_x86_64.whl

# Clean up
RUN rm -rf /root/downloads

# Set working directory
WORKDIR /app

# Command to run when starting the container
CMD ["/bin/bash"]
FROM python:3.10.12-slim

ENV DEBIAN_FRONTEND=noninteractive \
    NVIDIA_DRIVER_CAPABILITIES=all \
    PIP_PREFER_BINARY=1 \
    PYTHONUNBUFFERED=1

# Setup system packages
COPY builder/setup.sh /setup.sh
RUN /bin/bash /setup.sh && \
    rm /setup.sh

# Install ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git

WORKDIR /ComfyUI

RUN pip install -r requirements.txt && pip cache purge
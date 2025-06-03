FROM python:3


# This image is based on the latest official PyTorch image, because it already contains CUDA, CuDNN, and PyTorch
FROM pytorch/pytorch:2.6.0-cuda12.4-cudnn9-runtime

# Installs Git, because ComfyUI and the ComfyUI Manager are installed by cloning their respective Git repositories
RUN apt update --assume-yes && \
    apt install --assume-yes \
        build-essential \
        cmake \
        git \
        sudo \
        libgl1-mesa-glx \
        libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

# Clones the ComfyUI repository and checks out the latest release
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /opt/comfyui

RUN git clone https://github.com/Comfy-Org/ComfyUI-Manager.git /opt/comfyui-manager

WORKDIR  /opt/comfyui

RUN pip install -r requirements.txt

# Exposes the default port of ComfyUI (this is not actually exposing the port to the host machine, but it is good practice to include it as metadata,
# so that the user knows which port to publish)
EXPOSE 8188

# Adds the startup script to the container; the startup script will create all necessary directories in the models and custom nodes volumes that were
# mounted to the container and symlink the ComfyUI Manager to the correct directory; it will also create a user with the same UID and GID as the user
# that started the container, so that the files created by the container are owned by the user that started the container and not the root user
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

# On startup, ComfyUI is started at its default port; the IP address is changed from localhost to 0.0.0.0, because Docker is only forwarding traffic
# to the IP address it assigns to the container, which is unknown at build time; listening to 0.0.0.0 means that ComfyUI listens to all incoming
# traffic; the auto-launch feature is disabled, because we do not want (nor is it possible) to open a browser window in a Docker container
CMD ["/opt/conda/bin/python", "main.py", "--listen", "0.0.0.0", "--port", "8188", "--disable-auto-launch"]
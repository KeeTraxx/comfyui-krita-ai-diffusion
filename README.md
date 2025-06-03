# COMFYUI-KRITA-AI-DIFFUSION

Docker Compose ready [ComfyUI](https://www.comfy.org) container.

The main purpose is to have a running ComfyUI server to use with the Krita Plugin [krita-ai-diffusion](https://github.com/Acly/krita-ai-diffusion).

## Usage

Run `docker compose up`.

This will do two things:

1. Download all required and optional models, using this [script from krita-ai-diffusion](https://github.com/Acly/krita-ai-diffusion/blob/main/scripts/download_models.py)
   
   This will require about 150 GB of disk space!
2. Start a ComfyUI Server with ComfyUI Manager.

You can then access the ComfyUI Server at http://localhost:8188 and also configure the krita-ai-diffusion plugin to use this server address.

## Additional models

Put your own checkpoints in `models/checkpoints`.

## Motivation

This allows you to run Krita on a separate machine (like on your laptop), while offloading the AI computation/inference to a more powerful machine elsewhere.

## Room for improvements

* `docker compose up` will run everything as root, I'll accept a PR that can run this as a non-root user. But I can't find a elegant solution for this.
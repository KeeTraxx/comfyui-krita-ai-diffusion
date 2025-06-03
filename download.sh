# See https://docs.interstice.cloud/comfyui-setup/

pwd
git clone --depth 1 --recursive --shallow-submodules https://github.com/Acly/krita-ai-diffusion.git 
cd krita-ai-diffusion
git submodule update --init
python -m pip install aiohttp tqdm
python3 scripts/download_models.py -a /opt/download
chmod -R go+w /opt/download/*
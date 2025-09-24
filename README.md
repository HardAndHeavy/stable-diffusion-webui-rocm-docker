# Stable Diffusion web UI on GPU AMD Radeon in Docker

<h4 align="center">
    <p>
        <b>English</b> |
        <a href="https://github.com/HardAndHeavy/stable-diffusion-webui-rocm-docker/blob/main/docs/README_ru.md">Русский</a>
    </p>
</h4>

[Stable Diffusion web UI](https://github.com/AUTOMATIC1111/stable-diffusion-webui) in a [Docker container with GPU Radeon support](https://hub.docker.com/repository/docker/hardandheavy/stable-diffusion-webui-rocm/general). Tested on AMD Radeon RX 7900 XTX.

### Requirements
- Ubuntu
- make
- Docker
- git
- ROCm (see the installation in [transformers-rocm-docker](https://github.com/HardAndHeavy/transformers-rocm-docker?tab=readme-ov-file#install-rocm))

### Launch
```bash
git clone https://github.com/HardAndHeavy/stable-diffusion-webui-rocm-docker
cd stable-diffusion-webui-rocm-docker
make run
```

At the first start, a lengthy initialization process will take place. When the process is completed, Stable Diffusion will be available at http://localhost.

### Remarks
- To add new node resources, you must grant access to the directory `./data`, because the container was started as the root user. To do this, run the command `sudo chmod a+rw -R ./data`
- Models are located in the directory `./data/stable-diffusion/models/Stable-diffusion`. Models can be found on the site [civitai.com](https://civitai.com/)
- If there is a major change in the composition of python libraries, you must change the version of `CONDA_DIR` in `./Makefile`

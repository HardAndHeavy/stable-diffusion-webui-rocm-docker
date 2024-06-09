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
- `git clone https://github.com/HardAndHeavy/stable-diffusion-webui-rocm-docker`
- `cd stable-diffusion-webui-rocm-docker`
- `make run`

At the first start, a lengthy initialization process will take place. When the process is completed, Stable Diffusion will be available at http://localhost .

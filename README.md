# Stable Diffusion web UI на GPU AMD Radeon в Docker

<h4 align="center">
    <p>
        <b>Русский</b> |
        <a href="https://github.com/HardAndHeavy/stable-diffusion-webui-rocm-docker/blob/main/README_en.md">English</a>
    </p>
</h4>

[Stable Diffusion web UI](https://github.com/AUTOMATIC1111/stable-diffusion-webui) в Docker [контейнере с поддержкой GPU Radeon](https://hub.docker.com/repository/docker/hardandheavy/stable-diffusion-webui-rocm/general). Проверено на AMD Radeon RX 7900 XTX.

### Необходимое окружение
- Ubuntu
- make
- Docker
- git
- ROCm ([установка](https://github.com/HardAndHeavy/transformers-rocm-docker?tab=readme-ov-file#install-rocm))

### Запуск
- `git clone https://github.com/HardAndHeavy/stable-diffusion-webui-rocm-docker`
- `cd stable-diffusion-webui-rocm-docker`
- `make run`

При первом запуске будет происходить длительный процесс инициализации. Когда процесс завершится, Stable Diffusion станет доступен по адресу http://localhost.

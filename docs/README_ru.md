# Stable Diffusion web UI на GPU AMD Radeon в Docker

<h4 align="center">
    <p>
        <a href="https://github.com/HardAndHeavy/stable-diffusion-webui-rocm-docker">English</a> |
        <b>Русский</b>
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
```bash
git clone https://github.com/HardAndHeavy/stable-diffusion-webui-rocm-docker`
cd stable-diffusion-webui-rocm-docker
make run
```

При первом запуске будет происходить длительный процесс инициализации. Когда процесс завершится, Stable Diffusion станет доступен по адресу http://localhost.

### Замечания
- Для добавления новых ресурсов узлов необходимо предоставить доступ к каталогу `./data`, так как контейнер запускался от имени пользователя root. Для этого нужно выполнить команду `sudo chmod -R 777 ./data`
- Модели располагаются в каталоге `./data/stable-diffusion/models/Stable-diffusion`. Модели можно найти на сайте [civitai.com](https://civitai.com/)
- При серьёзном изменении состава библиотек python необходимо изменить версию `CONDA_DIR` в `./Makefile`

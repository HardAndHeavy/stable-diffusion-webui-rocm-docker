FROM hardandheavy/transformers-rocm:2.1.0

EXPOSE 80

ENV SABLE_DIFFUSION_WEBUI_VERSION=1.9.4
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui /app && \
    cd /app && \
    git checkout v${SABLE_DIFFUSION_WEBUI_VERSION}
WORKDIR /app

# https://github.com/Mikubill/sd-webui-controlnet/discussions/2442
RUN pip install insightface
ENV PATH /opt/miniconda_sd_v2.1.0/bin:${PATH}

COPY ./docker/Makefile ./Makefile

CMD make run

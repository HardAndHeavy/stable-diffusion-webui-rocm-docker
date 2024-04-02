FROM hardandheavy/transformers-rocm:2.0.3

EXPOSE 80

ENV SABLE_DIFFUSION_WEBUI_VERSION=1.8.0
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui /app && \
    cd /app && \
    git checkout v${SABLE_DIFFUSION_WEBUI_VERSION}
WORKDIR /app

ENV PATH /opt/miniconda_sd_v1/bin:${PATH}

COPY ./make-docker.mk ./Makefile

CMD make run

FROM hardandheavy/transformers-rocm:2.3.0

EXPOSE 80

WORKDIR /app
COPY ./docker/Makefile ./Makefile

CMD make run

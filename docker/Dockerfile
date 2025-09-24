FROM hardandheavy/transformers-rocm:2.9.0

EXPOSE 80

RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0

WORKDIR /app
COPY ./docker/Makefile ./Makefile
ENV INDEX_URL=https://pypi.org/simple/

CMD make run

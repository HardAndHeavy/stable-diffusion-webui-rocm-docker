FROM hardandheavy/transformers-rocm:2.6.0

EXPOSE 80

WORKDIR /app
COPY ./docker/Makefile ./Makefile
ENV INDEX_URL=https://pypi.org/simple/

CMD make run

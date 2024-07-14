CHECK_SEED_FILE = /check/check-seed-file

init:
	if [ ! -f $(CHECK_SEED_FILE) ]; then \
		git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui /sd-webui && \
		pip install insightface && \
		touch $(CHECK_SEED_FILE); fi

run: init
	cd /sd-webui && \
	python launch.py \
		--no-half \
		--precision=full \
		--port 80 \
		--listen \
		--enable-insecure-extension-access \
		--data-dir=/stable-diffusion

run-api: init
	cd /sd-webui && \
	python launch.py \
		--no-half \
		--precision=full \
		--port 80 \
		--listen \
		--enable-insecure-extension-access \
		--nowebui \
		--data-dir=/stable-diffusion

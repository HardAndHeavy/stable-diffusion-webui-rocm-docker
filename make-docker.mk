DIR = /opt/miniconda_sd_v1
CHECK_SEED_FILE = $(DIR)/check-seed-file

init:
	if [ ! -f $(CHECK_SEED_FILE) ]; then \
		cp -r /opt/miniconda/* $(DIR) && \
		touch $(CHECK_SEED_FILE); fi

run: init
	python launch.py \
		--no-half \
		--precision=full \
		--port 80 \
		--listen \
		--enable-insecure-extension-access \
		--data-dir=/stable-diffusion

run-api: init
	python launch.py \
		--no-half \
		--precision=full \
		--port 80 \
		--listen \
		--enable-insecure-extension-access \
		--nowebui \
		--data-dir=/stable-diffusion

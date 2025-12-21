include hsa_override.mk

CUR_VERSION = 2.10.0
CONDA_DIR = $(PWD)/data/miniconda_v$(CUR_VERSION)

build:
	docker build -t stable-diffusion-webui-rocm:$(tag) -f docker/Dockerfile .

publish:
	docker image tag stable-diffusion-webui-rocm:$(tag) hardandheavy/stable-diffusion-webui-rocm:$(tag)
	docker push hardandheavy/stable-diffusion-webui-rocm:$(tag)
	docker image tag stable-diffusion-webui-rocm:$(tag) hardandheavy/stable-diffusion-webui-rocm:latest
	docker push hardandheavy/stable-diffusion-webui-rocm:latest

seed:
	if [ ! -f "$(CONDA_DIR)/conda-check-seed-file" ]; then \
		docker run -it --rm \
			-v $(CONDA_DIR):/opt/miniconda_seed \
			hardandheavy/stable-diffusion-webui-rocm:$(CUR_VERSION) sh -c \
				"cp -r /opt/miniconda/* /opt/miniconda_seed && \
				touch /opt/miniconda_seed/conda-check-seed-file"; fi

run: seed
	docker run -it --rm \
		-p 80:80 \
		--device=/dev/kfd \
		--device=/dev/dri \
		--ipc=host \
		--cap-add=SYS_PTRACE \
		--security-opt seccomp=unconfined \
		-e HSA_OVERRIDE_GFX_VERSION=$(HSA_OVERRIDE_GFX_VERSION) \
		-e HSA_ENABLE_SDMA=0 \
		-v ./data/check:/check \
		-v ./data/home:/root \
		-v $(CONDA_DIR):/opt/miniconda \
		-v ./data/stable-diffusion:/stable-diffusion \
		-v ./data/sd-webui:/sd-webui \
		-v ~/.ssh:/root/.ssh \
		-v ~/.ssh/known_hosts:/root/.ssh/known_hosts \
		hardandheavy/stable-diffusion-webui-rocm:$(CUR_VERSION)

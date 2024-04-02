ROCM_GPU ?= $(strip $(shell rocminfo | grep -m 1 -E gfx[^0]{1} | sed -e 's/ *Name: *//'))
ifeq ($(ROCM_GPU), gfx1030)
  HSA_OVERRIDE_GFX_VERSION = 10.3.0
else ifeq ($(ROCM_GPU), gfx1100)
  HSA_OVERRIDE_GFX_VERSION = 11.0.0
else
  HSA_OVERRIDE_GFX_VERSION = "GFX version detection error"
endif

build:
	docker build -t stable-diffusion-webui-rocm:$(tag) -f Dockerfile .

publish:
	docker image tag stable-diffusion-webui-rocm:$(tag) hardandheavy/stable-diffusion-webui-rocm:$(tag)
	docker push hardandheavy/stable-diffusion-webui-rocm:$(tag)
	docker image tag stable-diffusion-webui-rocm:$(tag) hardandheavy/stable-diffusion-webui-rocm:latest
	docker push hardandheavy/stable-diffusion-webui-rocm:latest

bash:
	docker run -it --rm \
		-p 80:80 \
		--device=/dev/kfd \
		--device=/dev/dri \
		--ipc=host \
		--cap-add=SYS_PTRACE \
		--security-opt seccomp=unconfined \
		-e HSA_OVERRIDE_GFX_VERSION=$(HSA_OVERRIDE_GFX_VERSION) \
		-v ./data/stable-diffusion:/stable-diffusion \
		-v ./data/repositories:/app/repositories \
		-v ./data/home:/root \
		-v ./data/miniconda_sd_v1:/opt/miniconda_sd_v1 \
		stable-diffusion-webui-rocm:$(tag) bash

run:
	docker run -it --rm \
		-p 80:80 \
		--device=/dev/kfd \
		--device=/dev/dri \
		--ipc=host \
		--cap-add=SYS_PTRACE \
		--security-opt seccomp=unconfined \
		-e HSA_OVERRIDE_GFX_VERSION=$(HSA_OVERRIDE_GFX_VERSION) \
		-v ./data/stable-diffusion:/stable-diffusion \
		-v ./data/repositories:/app/repositories \
		-v ./data/home:/root \
		-v ./data/miniconda_sd_v1:/opt/miniconda_sd_v1 \
		hardandheavy/stable-diffusion-webui-rocm:latest

IMAGE_NAME=test_make

linux:
	docker build --build-arg OS=linux ARCH=$(shell dpkg --print-architecture) -t $(IMAGE_NAME) .
	docker run $(IMAGE_NAME)
windows:
	docker build --build-arg OS=windows --build-arg ARCH=$(shell wmic os get osarchitecture | findstr [0-9]) -t $(IMAGE_NAME) .
	docker run $(IMAGE_NAME)
macos:
	docker build --build-arg OS=darwin --build-arg ARCH=$(shell arch) -t $(IMAGE_NAME) .
	docker run $(IMAGE_NAME)
image:
	docker build --build-arg OS=darwin --build-arg ARCH=$(shell arch) -t $(IMAGE_NAME) .
	docker run $(IMAGE_NAME)
clean:
	docker rmi -f $(IMAGE_NAME)

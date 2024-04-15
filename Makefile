IMAGE_NAME=test_make

linux:
	docker build --build-arg OS=linux ARCH=$(shell dpkg --print-architecture) -t $(IMAGE_NAME) .
windows:
	docker build --build-arg OS=windows --build-arg ARCH=$(shell wmic os get osarchitecture | findstr [0-9]) -t $(IMAGE_NAME) .
macos:
	docker build --build-arg OS=darwin --build-arg ARCH=$(shell arch) -t $(IMAGE_NAME) .
stop:
	docker stop $(IMAGE_NAME):latest
clean: stop
	docker rmi -f $(IMAGE_NAME)

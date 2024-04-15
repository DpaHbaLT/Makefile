IMAGE_NAME=test_make

linux:
	ARCH=$(shell uname -m)
	docker build --build-arg GOOS=linux GOARCH=$(ARCH) -t $(IMAGE_NAME) .
windows:
	ARCH=$(shell wmic os get osarchitecture | findstr [0-9])
	docker build --build-arg GOOS=windows --build-arg GOARCH=$(ARCH) -t $(IMAGE_NAME) .
macos:
	ARCH=$(shell arch)
	docker build --build-arg GOOS=darwin --build-arg GOARCH=$(ARCH) -t $(IMAGE_NAME) .
clean:
	docker rmi -f $(IMAGE_NAME)
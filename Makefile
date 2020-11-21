USERID := $(shell id -u)

build:
	DOCKER_BUILDKIT=1 docker build -t exercism:latest --build-arg USERID=${USERID} .

run_bash:
	docker run --name exercism --rm -ti -v "$(CURDIR)":/app -v "$(CURDIR)/.config":/home/exercism/.config --entrypoint bash exercism:latest
test:

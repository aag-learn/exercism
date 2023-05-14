.PHONY: all
USER_NAME=$(shell id -u -n)
USER_ID=$(shell id -u)
GROUP_NAME=$(shell id -g -n)
GROUP_ID=$(shell id -g)

build:
	DOCKER_BUILDKIT=1 docker build -t exercism:latest --build-arg USERID=${USERID} .

build_bash:
	DOCKER_BUILDKIT=1 docker build -f Dockerfile_bash -t bash:latest --build-arg USERID=${USERID} .


run_bash:
	docker run --name bash --rm -ti -v "$(CURDIR)":/home/exercism/src bash:latest


build_ruby:
	docker compose build ruby

run_ruby:
	docker compose run --rm ruby


build_lua:
	 USER_NAME=${USER_NAME} USER_ID=${USER_ID}  GROUP_NAME=${GROUP_NAME} GROUP_ID=${GROUP_ID} docker compose build lua

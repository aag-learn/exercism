USERID := $(shell id -u)

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
test:

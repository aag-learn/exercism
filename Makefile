USERID := $(shell id -u)

build:
	DOCKER_BUILDKIT=1 docker build -t exercism:latest --build-arg USERID=${USERID} .

build_bash:
	DOCKER_BUILDKIT=1 docker build -f Dockerfile_bash -t bash:latest --build-arg USERID=${USERID} .

run_bash:
	docker run --name bash --rm -ti -v "$(CURDIR)":/home/exercism/src bash:latest


build_ruby:
	DOCKER_BUILDKIT=1 docker build -f Dockerfile_ruby -t exercism_ruby:latest --build-arg USERID=${USERID} .

run_ruby:
	docker run --name exercism_ruby --rm -ti -v "$(CURDIR)/ruby":/home/exercism/ruby -v "$(CURDIR)/.config/exercism":/home/exercism/.config/exercism exercism_ruby:latest

test:

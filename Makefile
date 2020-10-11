
build:
	DOCKER_BUILDKIT=1 docker build -t exercism:latest .

run_bash:
	docker run --name exercism --rm -ti -v "$(CURDIR)":/app -v "$(CURDIR)/.config":/root/.config --entrypoint bash exercism:latest
test:

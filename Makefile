
SHELL := /bin/bash

build:
	docker build -f optimus.Dockerfile -t optimus-builder .
	docker run -it --rm \
	        -v ./output:/app/optimus/events/output:rw \
	        -v ./abi:/app/optimus/events/abi:rw \
			-v ./config/substream_config.json:/app/optimus/events/substream_config.json \
			optimus-builder

start:
	. .env
	docker compose up

restart:
	make stop
	make start

stop:
	docker compose down

.PHONY: all
.PHONY: package

PWD := $(shell pwd)
USER := $(shell whoami)

all: build package

package: package-0 package-1

build:
	docker build -t pve-qemu-unlocked .

package-0:
	mkdir -p bin/
	chown ${USER}:docker -R bin/
	docker run -v ${PWD}/bin/:/mnt/ -it pve-qemu-unlocked bash -c 'cd /opt/pve-qemu/; cp *.deb /mnt/'

package-1:
	BUILD_NAME=$(shell find bin/ -name "*.deb" | grep -v dbg | sed "s/^bin.//;s/\.deb//") && \
		mv bin $${BUILD_NAME} && \
		tar -czvf $${BUILD_NAME}.tar.gz $${BUILD_NAME} && \
		rm -rf $${BUILD_NAME} && \
		mkdir bin/ && \
		mv $${BUILD_NAME}.tar.gz bin/

shell:
	@docker run -it pve-qemu-unlocked bash

kill:
	@docker stop $(shell docker ps -a -q) 2>/dev/null || echo

clean:
	rm -rf bin/
	@docker stop $(shell docker ps -a -q) 2>/dev/null || echo > /dev/null
	@docker rm $(shell docker ps -a -q) 2>/dev/null || echo > /dev/null
	@docker rmi $(shell docker images -a -q) 2>/dev/null || echo > /dev/null

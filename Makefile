SHELL = /bin/bash
export BUILD_HARNESS_PATH ?= $(shell until [ -d "build-harness" ] || [ "`pwd`" == '/' ]; do cd ..; done; pwd)/build-harness
-include $(BUILD_HARNESS_PATH)/Makefile

APP?=route53-kubernetes

.PHONY : init
## Init build-harness
init:
	@echo "BUMP"
#	@curl --retry 5 --retry-delay 1 https://raw.githubusercontent.com/cloudposse/build-harness/master/bin/install.sh | bash






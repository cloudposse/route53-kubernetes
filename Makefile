SHELL = /bin/bash
export BUILD_HARNESS_PATH ?= $(shell until [ -d "build-harness" ] || [ "`pwd`" == '/' ]; do cd ..; done; pwd)/build-harness
-include $(BUILD_HARNESS_PATH)/Makefile

APP:=route53-kubernetes
COPYRIGHT_SOFTWARE:=Route53-Kubernetes mapping
COPYRIGHT_SOFTWARE_DESCRIPTION:=This is a Kubernetes service that polls services and ingresses and adds the appropriate alias to the specified domain. 

.PHONY : init
## Init build-harness
init:
	@curl --retry 5 --retry-delay 1 https://raw.githubusercontent.com/cloudposse/build-harness/master/bin/install.sh | bash

.PHONY : clean
## Clean build-harness
clean:
	@rm -rf $(BUILD_HARNESS_PATH)

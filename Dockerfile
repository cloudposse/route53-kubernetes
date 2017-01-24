FROM golang:1.7-alpine

ARG RUN_TESTS=0

ENV GIN_MODE=release


RUN apk add --update ca-certificates && \
    rm -rf /var/cache/apk/* /tmp/*

COPY ./ /go/src/github.com/cloudposse/route53-kubernetes

WORKDIR /go/src/github.com/cloudposse/route53-kubernetes

RUN set -ex \
	&& apk add --no-cache --virtual .build-deps \
		git \
		make \
		curl \
		bash \
		build-base \
		&& make init \
    && make go:deps-build \
    && make go:deps-dev \
    && make go:lint \
		&& make go:deps \
		&& ( [[ $RUN_TESTS -eq 0 ]]  ||  make go:test; )  \
    && make go:build \
		&& go-wrapper install \
		&& rm -rf  /go/src \
		&& apk del .build-deps

WORKDIR $GOPATH

ENTRYPOINT ["route53-kubernetes"]

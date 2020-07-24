# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.9.3

FROM renovate/buildpack:2-ruby@sha256:11669c0f9c00bbed06bbd12f7785ce4d9341ac7ac350935c10e73b7c8f86bb64

ARG RUBY_VERSION=2.7.1
RUN install-tool ruby

ARG COCOAPODS_VERSION
RUN install-gem cocoapods

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-cocoapods" \
      org.opencontainers.image.version="${COCOAPODS_VERSION}"

USER 1000

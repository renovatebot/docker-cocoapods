# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.9.3

FROM renovate/buildpack:2-ruby@sha256:e09e0f95e2ae0c5b808d1269098dc5fd560fea8816d58bd85b670bd01fa9c1c6

ARG RUBY_VERSION=2.7.1
RUN install-tool ruby

ARG COCOAPODS_VERSION
RUN install-gem cocoapods

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-cocoapods" \
      org.opencontainers.image.version="${COCOAPODS_VERSION}"

USER 1000

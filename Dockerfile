# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.9.3

FROM renovate/buildpack:2-ruby@sha256:9f390fa33873c64b14a071d7167c2759431b7ee9541b50a2ae95fb139f1cd721

ARG RUBY_VERSION=2.7.1
RUN install-tool ruby

ARG COCOAPODS_VERSION
RUN install-gem cocoapods

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-cocoapods" \
      org.opencontainers.image.version="${COCOAPODS_VERSION}"

USER 1000

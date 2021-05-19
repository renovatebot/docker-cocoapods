# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.1

# renovate: datasource=github-releases depName=containerbase/ruby-prebuild versioning=ruby
ARG RUBY_VERSION=2.7.3

#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:5-ruby@sha256:8ae4335b80f1391b9b60b5f2d05937b01abb9d17ae4a760bf90c0c5206b83636

ARG RUBY_VERSION
RUN install-tool ruby

ARG COCOAPODS_VERSION
RUN install-gem cocoapods

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-cocoapods" \
  org.opencontainers.image.version="${COCOAPODS_VERSION}"

USER 1000

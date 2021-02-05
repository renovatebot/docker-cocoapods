#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.1

FROM renovate/buildpack:3-ruby@sha256:68d4e5edd5559d6a4fe8c80e01295e41a66aca2bf72827fe2210d9d31c280735 as base-latest
FROM renovate/buildpack:3-ruby-bionic@sha256:42d0d0eb5cf09c71c303a990a433c83d7f8a484d1edb6f4653f13c897103c3e0 as base-bionic
FROM renovate/buildpack:3-ruby-focal@sha256:deb080d7fe7e07825d2fab8b63e1009d59db1047af67a24056aea16a8c722017 as base-focal

#--------------------------------------
# Image: final
#--------------------------------------
FROM base-${FLAVOR}

# renovate: datasource=ruby-version depName=ruby-version versioning=ruby
ARG RUBY_VERSION=2.7.2
RUN install-tool ruby

ARG COCOAPODS_VERSION
RUN install-gem cocoapods

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-cocoapods" \
  org.opencontainers.image.version="${COCOAPODS_VERSION}"

USER 1000

# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.1

# renovate: datasource=ruby-version depName=ruby-version versioning=ruby
ARG RUBY_VERSION=2.7.2

#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:4-ruby@sha256:0cb9f4449b6d7c0a6bff90a9c005e5a679e6df2e3f5b49a11bc174d83238d54e

ARG RUBY_VERSION
RUN install-tool ruby

ARG COCOAPODS_VERSION
RUN install-gem cocoapods

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-cocoapods" \
  org.opencontainers.image.version="${COCOAPODS_VERSION}"

USER 1000

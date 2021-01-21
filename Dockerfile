#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.1

FROM renovate/buildpack:2-ruby@sha256:cc1793e1cb1c89f9bb2908ea5158988c4c3611f79c8c442dbae7af7db5b1b0f0 as base-latest
FROM renovate/buildpack:2-ruby-bionic@sha256:e7191b5a00e521048ef35649aba9a6c5ddebc01758b771ea94e00d19dfa282e9 as base-bionic
FROM renovate/buildpack:2-ruby-focal@sha256:eab4bfb79917e07b7766daa9fe58796254a4dc47449940e8a73717f6e32b7469 as base-focal

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

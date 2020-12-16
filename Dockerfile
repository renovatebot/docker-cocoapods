#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.0

FROM renovate/buildpack:2-ruby@sha256:fd52db5d85a66b57c85dac1032c16af42b26489040568dcf83bf21889961da7f as base-latest
FROM renovate/buildpack:2-ruby-bionic@sha256:1f466c1061209f1bc3c7ab65df06fd6fe893c2ea4b5afe8c2c47b2f751f87af8 as base-bionic
FROM renovate/buildpack:2-ruby-focal@sha256:35d1816dd2c0a46f0f3d036cdc23e04cbd0b15dc178eeb8f0012edf6a1d44555 as base-focal

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

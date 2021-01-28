#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.1

FROM renovate/buildpack:2-ruby@sha256:744191e520049525cbdc77f35e3e6332ec6e242ca8c0e02db7b28d0a8cde5d9b as base-latest
FROM renovate/buildpack:2-ruby-bionic@sha256:60c26d921c781a1cbadaf67150a61c41e1f0a77cca98cbe6d2299794b62dd63b as base-bionic
FROM renovate/buildpack:2-ruby-focal@sha256:a347df01cd0e63a7d0bf9e419f7a00b5a371865283d9737fd4802f4f4343e4b4 as base-focal

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

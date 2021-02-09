#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.1

FROM renovate/buildpack:3-ruby@sha256:e8ae8e0812d3879a32faa70d26496825cc1f88faeb1b61bf17056b08050864f3 as base-latest
FROM renovate/buildpack:3-ruby-bionic@sha256:f60fe24dd0e539aaac73cf2ccc4ee5a63d47b42b41901a5ba85f8b898b6063d1 as base-bionic
FROM renovate/buildpack:3-ruby-focal@sha256:72da0d89923f50c43b8d2a31afaadfe6c85fd9d86e707f4babacbf3e0d4d7558 as base-focal

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

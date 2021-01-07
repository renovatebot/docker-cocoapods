#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.1

FROM renovate/buildpack:2-ruby@sha256:b16961aba5564d537d6d562cc97e660b25a75baf12c385600f29cccd92fdba23 as base-latest
FROM renovate/buildpack:2-ruby-bionic@sha256:254922ee3fd79f2bbf8fab39c0ba3d7183b32671987fdf83785ed9a99d8f5d59 as base-bionic
FROM renovate/buildpack:2-ruby-focal@sha256:e7ad862c2d057bce2ab728b6f8016f3bb5b7421c3fa0d9c5559f6f1aa7ab457d as base-focal

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

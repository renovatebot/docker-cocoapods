#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.0

FROM renovate/buildpack:2-ruby@sha256:5a3226a13f9efbfb3882154b77afbb2000299d20ee19d9c318a6ceab0e3ed330 as base-latest
FROM renovate/buildpack:2-ruby-bionic@sha256:2baa5976666838ff57ac0a22469946a9172cb287a0e2e49df1acd87ccfeb44a7 as base-bionic
FROM renovate/buildpack:2-ruby-focal@sha256:a04584517b8903fc9c9ff24172ba18f42f3acbbb44a8fa2367bf27aba3375b9e as base-focal

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

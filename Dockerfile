#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.0

FROM renovate/buildpack:2-ruby@sha256:bc49b122efdd88200ab6679cb4d66c9bd77924844c89edd834d70724494cbfb6 as base-latest
FROM renovate/buildpack:2-ruby-bionic@sha256:41f5df8cbb9e2292c24cdc925737f9487577a4befb26a3b554f03086ed4e1c6b as base-bionic
FROM renovate/buildpack:2-ruby-focal@sha256:a04584517b8903fc9c9ff24172ba18f42f3acbbb44a8fa2367bf27aba3375b9e as base-focal

#--------------------------------------
# Image: final
#--------------------------------------
FROM base-${FLAVOR}

# renovate: datasource=ruby-version depName=ruby-version versioning=ruby
ARG RUBY_VERSION=2.7.1
RUN install-tool ruby

ARG COCOAPODS_VERSION
RUN install-gem cocoapods

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-cocoapods" \
  org.opencontainers.image.version="${COCOAPODS_VERSION}"

USER 1000

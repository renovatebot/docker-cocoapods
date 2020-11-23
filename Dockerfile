#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.0

FROM renovate/buildpack:2-ruby@sha256:88e0bffb41e78b6d01331d1ccbdbfa088a8b661b846ba07105fd16503d714aea

#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:2-ruby${FLAVOR}

# renovate: datasource=ruby-version depName=ruby-version versioning=ruby
ARG RUBY_VERSION=2.7.1
RUN install-tool ruby

ARG COCOAPODS_VERSION
RUN install-gem cocoapods

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-cocoapods" \
      org.opencontainers.image.version="${COCOAPODS_VERSION}"

USER 1000

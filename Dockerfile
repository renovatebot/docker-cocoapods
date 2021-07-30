# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.2

# renovate: datasource=github-releases depName=containerbase/ruby-prebuild versioning=ruby
ARG RUBY_VERSION=2.7.4

#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:5-ruby@sha256:b2edd50734a6b9741977e5ef8ea31a8b73c1609a31f361631e6a5df9069d1071

ARG RUBY_VERSION
RUN install-tool ruby

ARG COCOAPODS_VERSION
RUN install-gem cocoapods

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-cocoapods" \
  org.opencontainers.image.version="${COCOAPODS_VERSION}"

USER 1000

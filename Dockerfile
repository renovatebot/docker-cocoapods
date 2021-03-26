# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.10.1

# renovate: datasource=ruby-version depName=ruby-version versioning=ruby
ARG RUBY_VERSION=2.7.2

#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:4-ruby@sha256:1ce12a2c3020e90f56e9c2e2a05005aff1186c5713481eae19fe70ec7b2cef59

ARG RUBY_VERSION
RUN install-tool ruby

ARG COCOAPODS_VERSION
RUN install-gem cocoapods

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-cocoapods" \
  org.opencontainers.image.version="${COCOAPODS_VERSION}"

USER 1000

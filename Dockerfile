# renovate: datasource=rubygems depName=cocoapods versioning=ruby
ARG COCOAPODS_VERSION=1.9.2

FROM renovate/buildpack:2-ruby@sha256:c83d691fae1ad0d4594c22607d594cad152bdfdf436998268bb57a9b4329a890

ARG RUBY_VERSION=2.7.1
RUN install-tool ruby

ARG COCOAPODS_VERSION
RUN install-gem cocoapods

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-cocoapods" \
      org.opencontainers.image.version="${COCOAPODS_VERSION}"

USER 1000
FROM renovate/ruby:latest

ARG COCOAPODS_VERSION

RUN gem install cocoapods -v ${COCOAPODS_VERSION}

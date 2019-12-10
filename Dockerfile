FROM renovate/ruby:2.6.5

ARG COCOAPODS_VERSION

RUN gem install cocoapods -v ${COCOAPODS_VERSION}

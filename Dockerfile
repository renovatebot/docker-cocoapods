FROM renovate/ruby@sha256:1c25e2b8e76557412434dd4c6a1c6057aafeae4f26418d119cf388bca265b295

ARG COCOAPODS_VERSION

RUN gem install cocoapods -v $COCOAPODS_VERSION --no-document

RUN pod --version

FROM renovate/ruby

ARG COCOAPODS_VERSION

RUN gem install cocoapods -v $COCOAPODS_VERSION --no-document

RUN pod --version

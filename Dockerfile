FROM renovate/ruby@sha256:6afab12b0dfe6b597b9e173f526577d300d04418ac70d18002265b61f40d7145

ARG COCOAPODS_VERSION

RUN gem install cocoapods -v $COCOAPODS_VERSION --no-document

RUN pod --version

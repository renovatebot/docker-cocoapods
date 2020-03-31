FROM renovate/ruby@sha256:3d30990fe2a79e7a4b7df2c4d484011f961cf4f8e2bddd8f11db11cf6758f353

ARG COCOAPODS_VERSION

RUN gem install cocoapods -v $COCOAPODS_VERSION --no-document

RUN pod --version

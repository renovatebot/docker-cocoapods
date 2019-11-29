FROM renovate/node@sha256:5f9461153755d482ebf16a5ebf57bda3c8ec9a9ad090aacf6381170ce1340d67

USER root

ARG COCOAPODS_VERSION

RUN apt-get update && apt-get install -y ruby && apt-get clean
RUN gem install --no-rdoc --no-ri cocoapods -v ${COCOAPODS_VERSION}

RUN chmod -R a+rw /usr/local
RUN chown -R ubuntu:ubuntu /home/ubuntu

USER ubuntu

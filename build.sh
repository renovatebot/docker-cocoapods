#!/bin/bash

export DATASOURCE=rubygems
export LOOKUP_NAME=cocoapods
export VERSION_SCHEME=ruby
export START_VERSION=1.0.0
export IMAGE=cocoapods
export IGNORED_VERSIONS=

npx renovatebot/dockerbuilder

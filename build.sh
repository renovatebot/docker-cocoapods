#!/bin/bash

export DATASOURCE=github
export LOOKUP_NAME=CocoaPods/CocoaPods
export VERSION_SCHEME=ruby
export START_VERSION=1.7.2
export IMAGE=cocoapods
export IGNORED_VERSIONS=

npx renovatebot/dockerbuilder

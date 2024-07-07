#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

s3cmd put public/assets/* s3://mashalifshin/assets/ --acl-public --add-header=Cache-Control:max-age=86400 --recursive

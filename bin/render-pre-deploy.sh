bundle exec rails db:migrate

s3cmd put public/assets/* s3://mashalifshin/assets/ --acl-public --add-header=Cache-Control:max-age=86400 --recursive

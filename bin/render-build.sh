set -e errexit

export NODE_OPTIONS=--openssl-legacy-provider

bundle install
yarn install
bundle exec rake assets:precompile
#bundle exec rake assets:clean
bundle exec rake db:migrate:down VERSION=20240424113250
bundle exec rake db:migrate:up VERSION=20240424113250
bundle exec rake db:migrate
#bundle exec rake db:seed

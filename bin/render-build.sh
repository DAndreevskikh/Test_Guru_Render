set -e errexit

export NODE_OPTIONS=--openssl-legacy-provider

bundle install
yarn install
bundle exec rake assets:precompile
#bundle exec rake assets:clean
bundle exec rake db:migrate
#bundle exec rake db:seed

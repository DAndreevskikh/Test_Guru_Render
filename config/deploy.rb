# config valid for current version and patch releases of Capistrano
lock "~> 3.18.1"

set :application, "Test_Guru"
set :repo_url, "https://github.com/DAndreevskikh/Test_Guru.git"

# Directory to deploy
set :deploy_to, "/home/dmitry/Test_Guru"

# Specify the ruby version
set :rvm_ruby_version, '2.7.8'

# Files we want symlinking to specific entries in shared.
append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default branch is :main
set :branch, :main

# Default stage is :production
set :stage, :production

# Defaults to false
set :log_level, :debug

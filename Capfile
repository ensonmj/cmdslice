# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
require 'capistrano/ssh_doctor'
# set some rbenv variables anv validate rbenv_ruby
require 'capistrano/rbenv'
# will install rbenv ruby-build ruby bundler, depends on rbenv variables
require 'capistrano/rbenv_install'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/safe_deploy_to'
# cap <stage> setup to create secrets.yml on remote
# need local config/secrets.yml
require 'capistrano/secrets_yml'
# cap <stage> setup to create database.yml on remote
# don't need local config/database.yml
require 'capistrano/postgresql'
require 'capistrano/faster_assets'
require 'capistrano/puma'
# cap <stage> puma:nginx_config to upload a nginx site config
require 'capistrano/puma/nginx'
require 'new_relic/recipes'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

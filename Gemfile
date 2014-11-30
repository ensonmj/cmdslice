env = ENV['RAILS_ENV']
case env
when /development/i, /test/i, /staging/i
  source 'https://ruby.taobao.org'
when /production/i
  source 'https://rubygems.org'
else
  source 'https://ruby.taobao.org'
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0.rc1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: :development
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
#gem 'therubyracer',  platforms: :ruby

# Use jQuery as the JavaScript library
gem 'jquery-rails'
# fix turbolinks
gem 'jquery-turbolinks'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
gem 'puma'

# Use Capistrano for deployment
group :development do
  gem 'capistrano', require: false
  gem 'capistrano-ssh-doctor', require: false
  gem 'capistrano-rbenv-install', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-safe-deploy-to', require: false
  gem 'capistrano-secrets-yml', require: false
  gem 'capistrano-postgresql', require: false
  gem 'capistrano-faster-assets', require: false
  gem 'capistrano3-puma', require: false
end

group :development do
  gem 'sprite-factory'
  gem 'chunky_png'

  # Use debugger
  gem 'byebug'
  gem 'pry-rails'

  gem 'better_errors'
  gem 'binding_of_caller'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'bullet'
end

group :production do
  gem 'pg'
  # gems for deployment in heroku
  # gem 'rails_12factor'
end

gem 'marked-rails'
#gem 'codemirror-rails'

gem 'omniauth-github'
gem 'omniauth-identity'

gem 'bootstrap-sass'
gem 'autoprefixer-rails'
#gem 'font-awesome-sass'
gem 'pagedown-bootstrap-rails'

gem 'kaminari'

gem 'pundit'

gem 'parsley-rails'

gem 'newrelic_rpm'

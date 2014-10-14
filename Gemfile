env = ENV['RACK_ENV'] || ENV['RAILS_ENV']
case env
when /development/i, /test/i
  source 'https://ruby.taobao.org'
when /production/i
  source 'https://rubygems.org'
else
  source 'https://rubygems.org'
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: :development
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# fix turbolinks
gem 'jquery-turbolinks'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'marked-rails'
#gem 'codemirror-rails'

gem 'omniauth-github'
gem 'omniauth-identity'

gem 'settingslogic'

gem 'bootstrap-sass'
gem 'autoprefixer-rails'
#gem 'font-awesome-sass'
gem 'pagedown-bootstrap-rails'

gem 'sprite-factory', group: :development
gem 'chunky_png', group: :development

gem 'kaminari'

# Use debugger
gem 'byebug', group: [:development, :test]
gem 'pry-rails', group: :development

gem 'puma'

gem 'pundit'

gem 'parsley-rails'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'bullet'
end

# gems for deployment in heroku
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

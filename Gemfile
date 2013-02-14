source 'https://rubygems.org'

ruby "1.9.3"
gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'less-rails'
  gem 'twitter-bootstrap-rails'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem "asset_sync"
end

group 'development','test' do
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'spork'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'simplecov', :require => false
end

# AWS
gem "aws-sdk"
gem "aws-ses", :require => 'aws/ses'
gem 'mongoid-paperclip', :require => 'mongoid_paperclip'

# javascript
gem 'coffee-rails', '~> 3.2.1'
gem 'jquery-rails'

# server
gem 'thin'

# database
gem 'mongoid'
gem 'bson_ext'

gem 'kaminari'

# authentication
gem 'authlogic'

# statuses
gem 'aasm'

# delayed_job
gem 'delayed_job'
gem 'delayed_job_mongoid'

# template engine
gem 'slim'

# ssl
gem 'rack-ssl-enforcer'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
#
#

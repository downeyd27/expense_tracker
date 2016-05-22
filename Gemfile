source 'https://rubygems.org'
ruby '2.2.2'

gem 'awesome_print'
gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'coffee-rails', '~> 4.1.0'
gem 'connection_pool'
gem 'dalli'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'meta-tags', '~> 2.1'
gem 'puma'
gem 'pg'
gem 'rails', '4.2.6'
gem 'sass-rails', '>= 3.2'
gem 'sprockets', '~> 3.0'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

gem 'sdoc', '~> 0.4.0', group: :doc

group :development do
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'byebug', '~> 8.2', '>= 8.2.4'
  gem 'guard'
  gem 'guard-coffeescript', require: false
  gem 'guard-sass', require: false
  gem 'guard-rspec', require: false
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'guard-uglify', require: false
  # For Rails Panel in Chrome Dev Tools...
  # TODO: Specify livereload/Rack::Reload to ignore tmp/ folder
  # otherwise livereload will continue to reload.
  # gem 'meta_request'
  gem 'rack-livereload'
  gem 'quiet_assets', '~> 1.1'
  gem 'spring', '~> 1.7', '>= 1.7.1'
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'capybara', '~> 2.7'
  gem 'factory_girl_rails', '~> 4.7'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'simplecov', '~> 0.11.2', require: false
end

group :development, :test do
  gem 'launchy', '~> 2.4', '>= 2.4.3'
  gem 'pry', '~> 0.10.3'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
end

group :production do
  gem 'aws-sdk', '< 2.0'
  gem 'rails_12factor' # Recommended for Heroku
end

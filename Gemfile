source 'https://rubygems.org'
ruby '2.2.2'

gem 'autoprefixer-rails'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'meta-tags', '~> 2.1'
gem 'newrelic_rpm'
gem 'paperclip'
gem 'puma'
gem 'pg'
gem 'rails', '4.2.6'
gem 'sass-rails', '~> 5.0'
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
  gem 'meta_request' # For Rails Panel in Chrome Dev Tools... May need to specificy livereload/Rack::Reload to ignore tmp/ folder
  gem 'rack-livereload'
  gem 'quiet_assets', '~> 1.1'
  gem 'rails_real_favicon'
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

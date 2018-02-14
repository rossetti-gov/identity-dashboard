source 'https://rubygems.org'

ruby '~> 2.5.0'

gem 'rails', '~> 5.1'

gem 'actionmailer-text'
gem 'active_model_serializers'
gem 'delayed_job_active_record'
gem 'devise'
gem 'dotenv-rails'
gem 'enum_help'
gem 'figaro'
gem 'httparty'
gem 'jquery-rails'
gem 'json-jwt'
gem 'jwt'
gem 'newrelic_rpm'
gem 'pg', '~> 0.21'
gem 'pundit'
gem 'rack-canonical-host'
gem 'recipient_interceptor'
gem 'ruby_regex'
gem 'sass-rails'
gem 'secure_headers'
gem 'simple_form'
gem 'slim-rails'

group :deploy do
  gem 'capistrano'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
end

group :development do
  gem 'bummr', require: false
  gem 'rubocop'
  gem 'web-console'
end

group :development, :test do
  gem 'bullet'
  gem 'factory_bot_rails'
  gem 'i18n-tasks'
  gem 'pry'
  gem 'rspec-rails'
end

group :test do
  gem 'climate_control'
  gem 'codeclimate-test-reporter', require: nil
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'rack_session_access'
  gem 'shoulda-matchers'
  gem 'sinatra'
  gem 'timecop'
  gem 'webmock'
end

group :production do
  gem 'rack-timeout'
  gem 'rails_12factor'
end

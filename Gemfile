source 'https://rubygems.org'

ruby '2.3.3'

gem 'actionmailer-text'
gem 'active_model_serializers'
gem 'delayed_job_active_record'
gem 'devise'
gem 'dotenv-rails'
gem 'enum_help'
gem 'foreman', require: false
gem 'hashie'
gem 'httparty'
gem 'newrelic_rpm', '>= 3.9.8'
gem 'nokogiri', '>= 1.6.8'
gem 'omniauth-saml'
gem 'pg'
gem 'pundit'
gem 'rack-canonical-host'
gem 'rails', '~> 4.2.0'
gem 'recipient_interceptor'
gem 'ruby_regex'
gem 'sass-rails', '~> 5.0'
gem 'secure_headers', '~> 3.0.0'
gem 'simple_form'
gem 'slim-rails'
gem 'uglifier'

group :deploy do
  gem 'capistrano' # , '~> 3.4'
  gem 'capistrano-passenger'
  gem 'capistrano-rails' # , '~> 1.1', require: false
end

group :development do
  gem 'quiet_assets'
  gem 'rubocop'
  gem 'slim_lint'
  gem 'web-console'
end

group :development, :test do
  gem 'bullet'
  gem 'factory_girl_rails'
  gem 'i18n-tasks'
  gem 'mailcatcher', '0.6.3'
  gem 'pry'
  gem 'rspec-rails', '~> 3.4.0'
  gem 'saml_idp', git: 'https://github.com/18F/saml_idp.git', branch: 'master'
end

group :test do
  gem 'climate_control'
  gem 'codeclimate-test-reporter', require: nil
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'rack_session_access'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'webmock'
end

group :production do
  gem 'rack-timeout'
  gem 'rails_12factor'
end

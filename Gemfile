source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "~> 7.0.2"
gem "sprockets-rails"
gem 'pg', '~> 1.3', '>= 1.3.5'
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'ruby-enum'
gem 'mutations'
gem 'faraday'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'byebug'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'

  # Configuration through .env files
  gem 'dotenv-rails'
end

group :development do
  gem "web-console"
end

group :test do
  gem 'rspec-rails'
  gem 'database_cleaner-active_record'
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'
gem 'bootsnap', require: false
gem 'devise'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'letter_opener', group: :development
gem 'net-http'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.1'
gem 'redis', '~> 4.0'
gem 'rubocop-rails', require: false
gem 'sidekiq'
gem 'simplecov', require: false, group: :test
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'capybara'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'webdriver'
end

group :development do
  gem 'web-console'
end

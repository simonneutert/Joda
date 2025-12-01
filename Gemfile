# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :database do
  # gem 'jdbc-postgres', '~> 42.2'
  # gem 'jdbc-sqlite3', '~> 3.28'
  gem 'jdbc-h2', '~> 2.0'
end

group :development do
  gem 'htmlbeautifier'
  gem 'prism', '~> 1.6'
  gem 'rubocop', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rake', '~> 0.7.1', require: false
  gem 'rubocop-sequel', '~> 0.4.1', require: false
  gem 'yard', '~> 0.9.34'
end

group :test do
  gem 'minitest', '~> 5.26'
  gem 'rack-test', '~> 2.1'
end

gem 'logger', '~> 1.7'
gem 'ostruct', '~> 0.6.3'
gem 'puma', '~> 7.1.0'
gem 'rack-unreloader', '~> 2.1'
gem 'rackup', '~> 2.2.1'
gem 'rake', '~> 13.3'
gem 'roda', '~> 3.98'
gem 'sequel', '~> 5.99'
gem 'tilt', '~> 2.6'

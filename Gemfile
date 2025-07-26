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
  gem 'prism', '~> 1.4'
  gem 'pry', '~> 0.14.2'
  gem 'pry-debugger-jruby', '~> 2.1'
  gem 'rubocop', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rake', '~> 0.6.0', require: false
  gem 'rubocop-sequel', '~> 0.3.4', require: false
  gem 'yard', '~> 0.9.34'
end

group :test do
  gem 'minitest', '~> 5.2'
  gem 'rack-test', '~> 2.1'
end

gem 'logger', '~> 1.7'
gem 'ostruct', '~> 0.6.3'
gem 'puma', '~> 6.4.2'
gem 'rack-unreloader', '~> 2.1'
gem 'rackup', '~> 2.1.0'
gem 'rake', '~> 13.1'
gem 'roda', '~> 3.73'
gem 'sequel', '~> 5.74'
gem 'tilt', '~> 2.6'

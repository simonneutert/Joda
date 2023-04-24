# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# gem 'jdbc-postgres', '~> 42.2'
# gem 'jdbc-sqlite3', '~> 3.28'
gem 'jdbc-h2', '~> 2.0'

gem 'puma', '~> 6.2'
gem 'rack-unreloader', '~> 2.1'
gem 'rackup', '~> 2.1.0'
gem 'rake', '~> 13.0'
gem 'roda', '~> 3.67'
gem 'sequel', '~> 5.67'

group :development do
  gem 'fasterer', '~> 0.10.1', require: false
  gem 'htmlbeautifier'
  gem 'pry-debugger-jruby', '~> 2.1'
  gem 'rubocop', require: false
  gem 'rubocop-minitest', '~> 0.30.0', require: false
  gem 'rubocop-sequel', '~> 0.3.4', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rake', '~> 0.6.0', require: false
  gem 'solargraph', '~> 0.48.0', require: false
  gem 'yard', '~> 0.9.34'
end

group :test do
  gem 'minitest', '~> 5.16'
  gem 'rack-test', '~> 2.1'
end

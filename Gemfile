# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# gem 'jdbc-postgres', '~> 42.2'
# gem 'jdbc-sqlite3', '~> 3.28'
gem 'jdbc-h2', '~> 2.0'

gem 'puma', '~> 5.6'
gem 'rack-unreloader', '~> 2.0'
gem 'rackup', '~> 0.2.2'
gem 'rake', '~> 13.0'
gem 'roda', '~> 3.59'
gem 'sequel', '~> 5.59'

group :development do
  gem 'htmlbeautifier'
  gem 'pry-debugger-jruby', '~> 2.1'
  gem 'rubocop', require: false
  gem 'solargraph', '~> 0.47.2', require: false
  gem 'yard', '~> 0.9.28'
end

group :test do
  gem 'minitest', '~> 5.16'
end

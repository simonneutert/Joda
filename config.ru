# frozen_string_literal: true

dev = ENV['RACK_ENV'] == 'development'

require 'rack'
require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'rack/deflater'
require 'roda'
require 'json'
require 'irb' if dev

require 'logger'
logger = Logger.new($stdout)

require 'rack/unreloader'
Unreloader = Rack::Unreloader.new(subclasses: %w[Roda], logger: logger) { App }
Unreloader.require './app.rb'
Unreloader.require './routes.rb'

run(dev ? Unreloader : App.freeze.app)

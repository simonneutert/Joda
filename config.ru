# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'rack/deflater'
require 'roda'
require 'json'
require 'pry'

require 'rack/unreloader'
Unreloader = Rack::Unreloader.new(subclasses: %w[Roda]) { App }
Unreloader.require './app.rb'

dev = ENV['RACK_ENV'] == 'development'
run(dev ? Unreloader : App.freeze.app)

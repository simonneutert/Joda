# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'roda'
require 'json'
require 'pry'

require_relative 'db'

class App < Roda
  # gzips the http data
  # saved bandwidth at the price of cpu usage for `GET /jsondata`
  # as the demo json file is about 25 MB
  use Rack::Deflater if ENV['RACK_ENV'] == 'production'

  plugin :json

  data = { data: JSON.parse(File.read('./public/large-file.json')) }

  route do |r|
    # GET / request
    r.root do
      r.redirect '/hello'
    end

    r.on 'jsondata' do
      r.get 'items' do
        DB[:items].all
      end

      r.is do
        data
      end
    end

    # /hello branch
    r.on 'hello' do
      # Set variable for all routes in /hello branch
      @greeting = 'Hello'

      # GET /hello/world request
      r.get 'world' do
        "#{@greeting} world!"
      end

      r.on String do |name|
        <<~HTML
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Joda Document</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
        </head>
        <body>
          <div class="px-4 py-5 my-5 text-center">
            <img class="d-block mx-auto mb-4" src="https://www.jruby.org/images/jruby-logo.png" alt="JRuby Logo" max-width="100%">
            <h1 class="display-5 fw-bold">Joda 🖖 == JRuby + Roda</h1>
            <div class="col-lg-6 mx-auto">
              <p class="lead mb-4">Hello, #{name.capitalize}!</p>
            </div>
          </div> 
        </body>
        </html>
        HTML
      end

      # /hello request
      r.is do
        # GET /hello request
        r.get do
          "#{@greeting}!"
        end

        # POST /hello request
        r.post do
          puts "Someone said #{@greeting}!"
          r.redirect
        end
      end
    end

    r.on 'check_scope' do
      if @greeting
        @greeting.to_s
      else
        '@greeting is out of scope'
      end
    end
  end
end

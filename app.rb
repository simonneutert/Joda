# frozen_string_literal: true

JSON_FILE = File.read('./public/large-file.json')
SAMPLE_DATA = { data: JSON.parse(JSON_FILE) }.freeze

#
# The main App 🎉
#
class App < Roda
  # gzips the http data
  # saved bandwidth at the price of cpu usage for `GET /jsondata`
  # as the demo json file is about 25 MB
  use Rack::Deflater if ENV['RACK_ENV'] == 'production'

  plugin :json
  plugin :render
  plugin :hash_routes

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
        SAMPLE_DATA
      end
    end

    # /hello branch
    r.on 'hello' do
      # Set a variable for all routes in /hello branch
      @greeting = 'Hello'

      # GET /hello/world request
      r.get 'world' do
        "#{@greeting} world!"
      end

      r.on String do |name|
        @name = name
        view 'name'
      end

      # /hello request
      r.is do
        # GET /hello
        r.get do
          "#{@greeting}!"
        end

        # POST /hello
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

    r.hash_routes
  end
end

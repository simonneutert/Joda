# frozen_string_literal: true

require 'test_helper'
require 'minitest/autorun'

OUTER_APP = Rack::Builder.parse_file('config.ru')

class TestApp < Minitest::Test
  include Rack::Test::Methods

  def app
    OUTER_APP
  end

  def test_root
    get '/'
    assert last_response.redirect?
    assert_equal last_response.location, '/hello'
  end

  def test_root_redirection
    get '/'
    follow_redirect!
    assert last_response.ok?
    assert_equal last_response.body, 'Hello!'
  end

  def test_api_health
    get '/api/health'
    assert last_response.ok?
  end

  def test_api_v1_health
    get '/api/v1/health'
    assert last_response.ok?
  end
end

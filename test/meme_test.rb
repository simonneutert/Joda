# frozen_string_literal: true

require 'minitest/autorun'

class Meme
  def i_can_has_cheezburger?
    'OHAI!'
  end

  def will_it_blend?
    'YES!'
  end
end

# unit tests

class TestMeme < Minitest::Test
  def setup
    @meme = Meme.new
  end

  def test_that_kitty_can_eat
    assert_equal 'OHAI!', @meme.i_can_has_cheezburger?
  end

  def test_that_it_will_not_blend
    refute_match(/^no/i, @meme.will_it_blend?)
  end

  def test_that_will_be_skipped
    skip 'test this later'
  end
end

# specs

describe Meme do
  before do
    @meme = Meme.new
  end

  describe 'when asked about cheeseburgers' do
    it 'must respond positively' do
      _(@meme.i_can_has_cheezburger?).must_equal 'OHAI!'
    end
  end

  describe 'when asked about blending possibilities' do
    it "won't say no" do
      _(@meme.will_it_blend?).wont_match(/^no/i)
    end
  end
end
